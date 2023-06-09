part of 'cart_bloc.dart';

abstract class CartEvent {}

class GetItemCart extends CartEvent {}

class AddItemCart extends CartEvent {
  final CartModel cartModel;

  AddItemCart({required this.cartModel});
}

class AddTotalItemCart extends CartEvent {
  final String id;

  AddTotalItemCart({required this.id});
}

class ReduceTotalItemCart extends CartEvent {
  final String id;

  ReduceTotalItemCart({required this.id});
}

class DeleteItemCart extends CartEvent {
  final String id;

  DeleteItemCart({required this.id});
}

class DeleteAllItemCart extends CartEvent {}

class CheckedItemCart extends CartEvent {
  final String id;
  final bool value;

  CheckedItemCart({required this.value, required this.id});
}

class CheckedAllItemCart extends CartEvent {
  final bool value;
  CheckedAllItemCart({
    required this.value,
  });
}

class GetTotalPayment extends CartEvent {
  double total;
  GetTotalPayment({
    required this.total,
  });
}
