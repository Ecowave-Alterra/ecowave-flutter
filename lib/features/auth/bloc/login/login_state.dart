part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoginButtonDisabled;

  const LoginState({
    required this.isLoginButtonDisabled,
  });

  factory LoginState.initial() {
    return const LoginState(
      isLoginButtonDisabled: true,
    );
  }

  @override
  List<Object?> get props => [
        isLoginButtonDisabled,
      ];

  @override
  bool get stringify => true;

  LoginState copyWith({
    bool? isLoginButtonDisabled,
  }) {
    return LoginState(
      isLoginButtonDisabled: isLoginButtonDisabled ?? this.isLoginButtonDisabled,
    );
  }
}

class LoginSuccess extends LoginState {
  final String message;

  const LoginSuccess({
    required bool isLoginButtonDisabled,
    required this.message,
  }) : super(isLoginButtonDisabled: isLoginButtonDisabled);

  @override
  List<Object?> get props => [...super.props, message];

  @override
  bool get stringify => true;
}

class LoginError extends LoginState {
  final String errorMessage;

  const LoginError({
    required bool isLoginButtonDisabled,
    required this.errorMessage,
  }) : super(isLoginButtonDisabled: !isLoginButtonDisabled);

  @override
  List<Object?> get props => [...super.props, errorMessage];

  @override
  bool get stringify => true;
}

class LoginLoading extends LoginState {
  final bool isLoading;

  const LoginLoading({
    required bool isLoginButtonDisabled,
    required this.isLoading,
  }) : super(isLoginButtonDisabled: isLoginButtonDisabled);

  @override
  List<Object?> get props => [...super.props, isLoading];

  @override
  bool get stringify => true;
}