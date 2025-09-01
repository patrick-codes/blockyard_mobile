import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/dio/auth_repository.dart';
import '../../../utils/constants/api constants/api_constants.dart';
import '../repository/data model/user_model.dart';
import 'auth_events.dart';
import 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Dio _dio = Dio();

  AuthBloc() : super(AuthInitial()) {
    on<AppStartedEvent>(onAppStarted);
    on<RegisterUserEvent>(registerAccount);
    on<LoginUserEvent>(loginAccount);
    on<LogoutProfile>((event, emit) async {
      emit(AuthLoading());

      final prefs = await SharedPreferences.getInstance();

      // Clear stored token/session
      await prefs.remove("token");
      await prefs.remove("userId");

      emit(ProfileLoggedOut());
    });
  }
  Future<void> onAppStarted(
      AppStartedEvent event, Emitter<AuthState> emit) async {
    // emit(AuthLoading());

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('authToken');
    debugPrint('Token retrieved on app start: $token');

    if (token != null && token.isNotEmpty) {
      debugPrint('User is logged in with token: $token');

      return emit(AuthAuthenticated());
    } else {
      debugPrint('No token found, navigating to login.');

      return emit(AuthError('No token found, navigating to login.'));
    }
  }

  Future<void> registerAccount(
      RegisterUserEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading(isLoadingspin: true));
      try {
        final response = await _dio.post(
          signupUrl,
          data: {
            'name': event.name,
            'phone': event.phone,
            'email': event.email,
            'password': event.password,
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('authToken', response.data['token']);
          await prefs.setString('userId', response.data['_id']);

          final user = UserModel.fromJson(response.data);
          emit(AuthAuthenticated(user, 'Account created succesfully!!'));

          debugPrint('AuthToken saved locally.');
          debugPrint('AuthToken saved: ${response.data['token']}');
          debugPrint('User ID saved: ${response.data['_id']}');
        } else {
          emit(AuthError(response.data['message'] ?? 'Registration failed'));
        }
      } on DioException catch (e) {
        emit(AuthError(e.response?.data['message'] ??
            'Network/Server error during register'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> loginAccount(
      LoginUserEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await _dio.post(
        loginUrl,
        data: {
          'email': event.email,
          'password': event.password,
        },
      );

      if (response.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', response.data['token']);
        await prefs.setString('userId', response.data['_id']);

        final user = UserModel.fromJson(response.data);
        emit(AuthAuthenticated(user, 'Login succesfully!!'));

        debugPrint('AuthToken saved locally.');
        debugPrint('AuthToken saved: ${response.data['token']}');
        debugPrint('User ID saved: ${response.data['_id']}');
      } else {
        emit(AuthError(response.data['message'] ?? 'Login failed'));
      }
    } on DioException catch (e) {
      emit(AuthError(
          e.response?.data['message'] ?? 'Network/Server error during login'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
