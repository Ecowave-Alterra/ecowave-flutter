part of 'payment_detail_bloc.dart';

abstract class PaymentDetailEvent extends Equatable {
  const PaymentDetailEvent();

  @override
  List<Object> get props => [];
}

class ChangeShippingAddressEvent extends PaymentDetailEvent {
  final ShippingAddressModel shippingAddressModel;

  const ChangeShippingAddressEvent({
    required this.shippingAddressModel,
  });
}

class CheckoutNow extends PaymentDetailEvent {
  final ShippingAddressModel shippingAddressModel;
  final PaymentMethodModel paymentMethodModel;
  final ExpeditionModel expeditionModel;
  final VoucherModel voucherModel;
  final String statusTransaction;
  final List<ProductModel> products;
  final int totalPrice;

  const CheckoutNow({
    required this.shippingAddressModel,
    required this.paymentMethodModel,
    required this.expeditionModel,
    required this.voucherModel,
    required this.statusTransaction,
    required this.products,
    required this.totalPrice,
  });
}
