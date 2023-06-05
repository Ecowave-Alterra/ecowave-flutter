part of 'counter_item_bloc.dart';

@immutable
abstract class CounterItemEvent {}

class IncrementItem extends CounterItemEvent {}

class DecrementItem extends CounterItemEvent {}
