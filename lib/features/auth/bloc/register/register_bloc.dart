import 'package:ecowave/features/auth/model/models/register_model.dart';
import 'package:ecowave/features/auth/model/services/register_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
 final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;
  final TextEditingController noTelpController;

  RegisterBloc({
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.noTelpController,
    required this.usernameController
  }) : super(RegisterState.initial()) {

     on<RegisterInputChange>((event, emit) {
      state.isRegisterButtonDisabled == true;
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty && nameController.text.isNotEmpty && noTelpController.text.isNotEmpty && usernameController.text.isNotEmpty) {
        emit(const RegisterState(
          isRegisterButtonDisabled: false,
        ));
      } else if (emailController.text.isEmpty ||
          passwordController.text.isEmpty || nameController.text.isNotEmpty || noTelpController.text.isNotEmpty || usernameController.text.isNotEmpty) {
        emit(const RegisterState(
          isRegisterButtonDisabled: true,
        ));
      }
    });

     on<RegisterButtonPressed>((event, emit) async {
      try {
        emit(const RegisterLoading(isRegisterButtonDisabled: true, isLoading: true));

        final isEmailUsed =  RegisterService().checkDuplicateEmail(emailController.text);
        final isUsernameUsed =  RegisterService().checkDuplicateUsername(usernameController.text);
        final isRegistered = await RegisterService().register(RegisterModel(
            email: emailController.text, password: passwordController.text,username: usernameController.text, name: nameController.text,phoneNumber: noTelpController.text));
        emit(const RegisterLoading(isRegisterButtonDisabled: true, isLoading: false));
        emit(RegisterError(isRegisterButtonDisabled: true, errorMessage: 'Email Telah di gunakan',isEmailUsed: isEmailUsed, isUsernameUsed: isUsernameUsed));
        if (isRegistered){
          emit(const RegisterSuccess(isRegisterButtonDisabled: true, message: 'Berhasil'));
        }
      } catch (error) {
        await Future.delayed(const Duration(seconds: 2));
        
      }
    });


  }
 
  }