part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class DoChangePasswordEvent extends ChangePasswordEvent {
  final ChangePasswordModel request;
  const DoChangePasswordEvent({
    required this.request,
  });
}
