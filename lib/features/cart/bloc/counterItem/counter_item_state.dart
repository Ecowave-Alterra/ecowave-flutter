part of 'counter_item_bloc.dart';

@immutable
abstract class CounterItemState {}

class CounterItemInitial extends CounterItemState {}

class CounterItemLoaded extends CounterItemState {
  final int id;
  final int result;
  CounterItemLoaded({required this.result, required this.id});
}

class CounterItemError extends CounterItemState {}
