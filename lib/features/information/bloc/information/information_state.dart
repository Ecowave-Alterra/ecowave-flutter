part of 'information_bloc.dart';

abstract class InformationState extends Equatable {
  const InformationState();

  @override
  List<Object> get props => [];
}

class InformationInitial extends InformationState {}

class InformationLoading extends InformationState {}

class InformationSuccess extends InformationState {
  final List<InformationModel> data;

  const InformationSuccess({
    required this.data,
  });
  @override
  List<Object> get props => [data];
}

class InformationError extends InformationState {
  final String message;

  const InformationError({
    required this.message,
  });
}
