// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoginButtonDisabled;
  

  const LoginState({required this.isLoginButtonDisabled});

  factory LoginState.initial() => const LoginState(isLoginButtonDisabled: true);

  @override
  List<Object> get props => [isLoginButtonDisabled];

  @override
  bool get stringify => true;

  LoginState copyWith({
    bool? isLoginButtonDisabled,
  }) {
    return LoginState(
      isLoginButtonDisabled:
          isLoginButtonDisabled ?? this.isLoginButtonDisabled,
    );
  }
}
