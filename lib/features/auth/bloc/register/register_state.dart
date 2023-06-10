part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final bool isRegisterButtonDisabled;

  const RegisterState({
    required this.isRegisterButtonDisabled,
  });

  factory RegisterState.initial() {
    return const RegisterState(
      isRegisterButtonDisabled: true,
    );
  }

  @override
  List<Object?> get props => [
        isRegisterButtonDisabled,
      ];

  @override
  bool get stringify => true;

  RegisterState copyWith({
    bool? isRegisterButtonDisabled,
  }) {
    return RegisterState(
      isRegisterButtonDisabled: isRegisterButtonDisabled ?? this.isRegisterButtonDisabled,
    );
  }
}

class RegisterLoading extends RegisterState {
  final bool isLoading;

  const RegisterLoading({
    required bool isRegisterButtonDisabled,
    required this.isLoading,
  }) : super(isRegisterButtonDisabled: isRegisterButtonDisabled);

  @override
  List<Object?> get props => [...super.props, isLoading];

  @override
  bool get stringify => true;
}

class RegisterError extends RegisterState {
  final String errorMessage;
  final bool isEmailUsed;
  final bool isUsernameUsed;
  const RegisterError({
    required bool isRegisterButtonDisabled,
    required this.errorMessage,
    required this.isEmailUsed,
    required this.isUsernameUsed
  }) : super(isRegisterButtonDisabled: !isRegisterButtonDisabled);

  @override
  List<Object?> get props => [...super.props, errorMessage];

  @override
  bool get stringify => true;
}

class RegisterSuccess extends RegisterState {
  final String message;

  const RegisterSuccess({
    required bool isRegisterButtonDisabled,
    required this.message,
  }) : super(isRegisterButtonDisabled: isRegisterButtonDisabled);

  @override
  List<Object?> get props => [...super.props, message];

  @override
  bool get stringify => true;
}