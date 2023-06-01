part of 'expedition_bloc.dart';

abstract class ExpeditionEvent extends Equatable {
  const ExpeditionEvent();

  @override
  List<Object> get props => [];
}

class GetExpeditionsEvent extends ExpeditionEvent {}
