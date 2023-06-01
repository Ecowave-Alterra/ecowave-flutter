part of 'shipping_address_bloc.dart';

abstract class ShippingAddressState extends Equatable {
  const ShippingAddressState();

  @override
  List<Object> get props => [];
}

class ShippingAddressInitial extends ShippingAddressState {}

class ShippingAddressLoading extends ShippingAddressState {}

class ShippingAddressSuccess extends ShippingAddressState {
  final List<ShippingAddressModel> data;

  const ShippingAddressSuccess({
    required this.data,
  });
}

class ShippingAddressFailed extends ShippingAddressState {
  final String meesage;

  const ShippingAddressFailed({
    required this.meesage,
  });
}
