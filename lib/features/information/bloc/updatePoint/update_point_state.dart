part of 'update_point_bloc.dart';

abstract class UpdatePointState extends Equatable {
  const UpdatePointState();

  @override
  List<Object> get props => [];
}

class UpdatePointInitial extends UpdatePointState {}

class UpdatePointLoading extends UpdatePointState {}

class UpdatePointSuccess extends UpdatePointState {
  final String message;
  const UpdatePointSuccess({
    required this.message,
  });
}

class UpdatePointError extends UpdatePointState {
  final String message;

  const UpdatePointError({
    required this.message,
  });
}
