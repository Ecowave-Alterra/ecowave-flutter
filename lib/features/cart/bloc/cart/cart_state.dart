part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartSuccess extends CartState {
  final List<CartModel>? data;
  final int? index;

  CartSuccess({this.index, this.data});
}

class CartError extends CartState {}
