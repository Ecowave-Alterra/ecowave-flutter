part of 'expedition_bloc.dart';

abstract class ExpeditionState extends Equatable {
  const ExpeditionState();

  @override
  List<Object> get props => [];
}

class ExpeditionInitial extends ExpeditionState {}

class ExpeditionLoading extends ExpeditionState {}

class ExpeditionSuccess extends ExpeditionState {
  final List<ExpeditionModel> data;

  const ExpeditionSuccess({
    required this.data,
  });
}

class ExpeditionFailed extends ExpeditionState {
  final String meesage;

  const ExpeditionFailed({
    required this.meesage,
  });
}
