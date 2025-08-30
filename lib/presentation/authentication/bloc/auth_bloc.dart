import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/dio/auth_repository.dart';
import 'auth_events.dart';
import 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = AuthRepository();

  AuthBloc() : super(AuthInitial()) {
    on<AppStartedEvent>(onAppStarted);
    on<RegisterUserEvent>(registerAccount);
    on<LoginUserEvent>(loginAccount);
  }
  Future<void> onAppStarted(
      AppStartedEvent event, Emitter<AuthState> emit) async {
    //emit(AuthLoading());

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('authToken');
    debugPrint('Token retrieved on app start: $token');

    if (token != null && token.isNotEmpty) {
      debugPrint('User is logged in with token: $token');

      if (!emit.isDone) {
        emit(AuthAuthenticated());
      }
    } else {
      debugPrint('No token found, navigating to login.');
      if (!emit.isDone) {
        emit(AuthError('No token found, navigating to login.'));
      }
    }
  }

  Future<void> registerAccount(
      RegisterUserEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading(isLoadingspin: true));
      final user = await _authRepository.register(
        event.name,
        event.phone,
        event.email,
        event.password,
      );
      emit(AuthAuthenticated(user, 'Account created succesfully!!'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> loginAccount(
      LoginUserEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.login(event.email, event.password);
      emit(AuthAuthenticated(user, 'Login succesfully!!'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
