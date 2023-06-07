import 'package:bloc/bloc.dart';
import 'package:ecowave/features/auth/model/models/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../model/services/login_services.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginBloc({
    required this.emailController,
    required this.passwordController,
  }) : super(LoginState.initial()) {
    on<LoginButtonPressed>((event, emit) async {
      try {
        emit(const LoginLoading(isLoginButtonDisabled: true, isLoading: true));
        LoginService loginService = LoginService();
        String loginResponse = await loginService.login(Login(
            email: emailController.text, password: passwordController.text));

        

        // Add a delay of 2 seconds before emitting the success event
        await Future.delayed(const Duration(seconds: 2));
        emit(const LoginSuccess(
          isLoginButtonDisabled: false,
          message: "Login Sukses",
        ));
      } catch (error) {
        print(error);
        await Future.delayed(const Duration(seconds: 2));
        emit(LoginError(
          isLoginButtonDisabled: false,
          errorMessage: error.toString(),
        ));
      }
    });

    on<LoginInputChange>((event, emit) {
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        emit(const LoginState(
          isLoginButtonDisabled: false,
        ));
      }
    });
  }
}
