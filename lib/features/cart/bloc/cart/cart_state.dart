part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<CartModel> data;

  CartSuccess({required this.data});
}

class CartError extends CartState {}
