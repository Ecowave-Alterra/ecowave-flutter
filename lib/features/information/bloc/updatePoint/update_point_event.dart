part of 'update_point_bloc.dart';

abstract class UpdatePointEvent extends Equatable {
  const UpdatePointEvent();

  @override
  List<Object> get props => [];
}

class GetMessageEvent extends UpdatePointEvent {}
