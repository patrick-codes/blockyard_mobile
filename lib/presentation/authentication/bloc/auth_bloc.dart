import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/dio/dio_helper.dart';
import '../../../utils/constants/api constants/api_constants.dart';
import '../repository/data model/user_model.dart';

part 'auth_events.dart';
part 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // final DioHelper dioHelper = GetIt.I<DioHelper>();
  var verificationId = '';

  AuthBloc() : super(AuthInitial()) {
    on<AppStartedEvent>(onAppStarted);
    on<LoginSuccessful>(onLoginSuccessful);
    on<SignupEvent>(registerAccount);
  }

  Future<void> onAppStarted(
      AppStartedEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading(isLoading: true));

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('jwtToken');

    if (token != null && token.isNotEmpty) {
      await prefs.setString('jwtToken', token);
      debugPrint('New token stored: $token');

      final String? storedToken = prefs.getString('jwtToken');
      debugPrint('Token retrieved on app start: $storedToken');

      if (!emit.isDone) {
        emit(AuthSucces(
            userModel: userModelFromJson(jsonEncode(mockJson)),
            message: 'Account Registered Succesfully!'));
      }
    } else {
      debugPrint('No token found, navigating to login.');
      if (!emit.isDone) {
        emit(AuthUnauthenticated());
      }
    }
  }

  Future<void> registerAccount(
    SignupEvent event,
    Emitter<AuthState> emit,
  ) async {
    final requestBody = {
      'name': event.name,
      'phone': event.phone,
      'email': event.email,
      'password': event.password,
    };

    debugPrint('Request payload: $requestBody');

    final response = await DioHelper.postData(
      url: signupUrl,
      data: {
        'name': event.name,
        'phone': event.phone,
        'email': event.email,
        'password': event.password,
        "role": "customer",
      },
      requiresAuth: false,
    );

    debugPrint('Response Status Code: ${response.statusCode}');
    debugPrint('Response Body: ${response.data}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      final userModel = UserModel.fromJson(response.data);

      debugPrint('User Model: $userModel');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.data['token']);

      if (!emit.isDone) {
        emit(AuthSucces(
            userModel: userModel, message: 'Account Registered Succesfully!'));
      }
    } else if (response.statusCode == 401) {
      emit(AuthFailure(error: 'User Already Logged In on another device'));
      debugPrint('${response.statusMessage}');
    } else {
      debugPrint('Login failed: ${response.statusMessage}');
      debugPrint(' Failed to save jwtToken!');
      emit(AuthFailure(error: 'Login failed: ${response.statusMessage}'));
    }
  }

  Future<void> onLoginSuccessful(
      LoginSuccessful event, Emitter<AuthState> emit) async {
    final token = event.jwtToken;
    final prefs = await SharedPreferences.getInstance();

    debugPrint('Token stored: $token');
    await prefs.setString('jwtToken', token);
    if (!emit.isDone) {
      emit(AuthSucces(
          userModel: event.userModel,
          message: 'Account Registered Succesfully!'));
    }
  }

  // Future<void> onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
  //   try {
  //     final response = await DioHelper.postData(
  //       url: logoutUrl,
  //       data: {},
  //     );
  //     if (response.statusCode == 201) {
  //       await _auth.signOut();
  //       if (!emit.isDone) {
  //         emit(AuthLogoutSucces(message: response.data['message']));
  //         final SharedPreferences prefs = await SharedPreferences.getInstance();
  //         await prefs.remove('jwtToken');
  //         emit(AuthUnauthenticated());
  //         emit(AuthFailure(error: '${response.data['message']}'));
  //         debugPrint(response.data['message']);
  //       }
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     throw e.message!;
  //   } on FormatException catch (e) {
  //     throw e.message;
  //   } catch (e) {
  //     throw 'Unable to Logout. Try again';
  //   }
  // }
}
