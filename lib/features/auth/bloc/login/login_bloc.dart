import 'package:bloc/bloc.dart';
import 'package:ecowave/features/auth/model/models/login_model.dart';
import 'package:ecowave/features/auth/model/services/login_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

        final userId = await LoginService().login(Login(
            email: emailController.text, password: passwordController.text));

        if (userId != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('userId', userId.toString());

          emit(const LoginSuccess(
            isLoginButtonDisabled: false,
            message: "Login Sukses",
          ));
        } else {
          emit(const LoginError(
            isLoginButtonDisabled: false,
            errorMessage: "Gagal melakukan login",
          ));
        }
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
      state.isLoginButtonDisabled == true;
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        emit(const LoginState(
          isLoginButtonDisabled: false,
        ));
      } else if (emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        emit(const LoginState(
          isLoginButtonDisabled: true,
        ));
      }
    });
  }
}
