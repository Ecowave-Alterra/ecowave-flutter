part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class OnBottomNavTap extends HomeEvent {
  final int index;

  const OnBottomNavTap(this.index);

  @override
  List<Object?> get props => [index];
}

class LogOut extends HomeEvent {}

class UpdateSharedPreferences extends HomeEvent {
  

  const UpdateSharedPreferences();

  @override
  List<Object> get props => [];
}