import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginBloc({
    required this.emailController,
    required this.passwordController,
  }) : super(LoginState.initial()) {
  on<LoginEvent>((event,emit){
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
      emit(const LoginState(isLoginButtonDisabled: false));
    }else{
      emit(const LoginState(isLoginButtonDisabled: true));
    }
  });
  }

}
