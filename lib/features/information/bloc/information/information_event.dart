part of 'information_bloc.dart';

abstract class InformationEvent extends Equatable {
  const InformationEvent();

  @override
  List<Object> get props => [];
}

class GetInformationEvent extends InformationEvent {}
