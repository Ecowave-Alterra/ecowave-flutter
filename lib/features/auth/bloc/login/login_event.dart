part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}
class LoginButtonPressed extends LoginEvent {
  const LoginButtonPressed();
}
class LoginInputChange extends LoginEvent {
  const LoginInputChange();
}
class LoginSubmitted extends LoginEvent {}