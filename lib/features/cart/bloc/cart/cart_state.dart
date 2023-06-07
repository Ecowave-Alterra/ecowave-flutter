part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartSuccess extends CartState {
  final List<CartModel>? data;

  CartSuccess({this.data});
}

class CartError extends CartState {}
