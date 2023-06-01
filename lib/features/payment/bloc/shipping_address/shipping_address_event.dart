part of 'shipping_address_bloc.dart';

abstract class ShippingAddressEvent extends Equatable {
  const ShippingAddressEvent();

  @override
  List<Object> get props => [];
}

class GetShippingAddressesEvent extends ShippingAddressEvent {}
