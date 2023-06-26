part of 'information_bloc.dart';

abstract class InformationEvent extends Equatable {
  const InformationEvent();

  @override
  List<Object> get props => [];
}

class GetInformationEvent extends InformationEvent {
  final int id;
  const GetInformationEvent({
    required this.id,
  });
}

class GetMoreInformationEvent extends InformationEvent {
  final int id;
  const GetMoreInformationEvent({
    required this.id,
  });
}
