part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<CartModel> data;
  final double total;
  CartSuccess({
    required this.data,
    this.total = 0,
  });
}

class CartError extends CartState {}
