part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}
class RegisterInputChange extends RegisterEvent {
  const RegisterInputChange();
}
class RegisterButtonPressed extends RegisterEvent {
  const RegisterButtonPressed();
}