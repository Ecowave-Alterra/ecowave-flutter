import 'package:bloc/bloc.dart';
import 'package:ecowave/features/auth/model/models/login_model.dart';
import 'package:ecowave/features/profile/models/user_model.dart';
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

        final userData = await LoginService().login(LoginModel(
          email: emailController.text,
          password: passwordController.text,
        ));
        print(userData);
        if (userData['Status'] == 200) {
          final data = userData;
          final userModel = UserModel.fromJson(data);

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', userModel.token);

          emit(LoginSuccess(
            isLoginButtonDisabled: false,
            message: "Login Sukses",
            user: userModel,
          ));
        } else {
          emit(LoginError(
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
        emit(LoginState(
          isLoginButtonDisabled: false,
        ));
      } else if (emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        emit(LoginState(
          isLoginButtonDisabled: true,
        ));
      }
    });
  }
}
