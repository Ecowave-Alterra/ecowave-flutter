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

class ChangeExpeditionEvent extends PaymentDetailEvent {
  final ExpeditionModel expeditionModel;

  const ChangeExpeditionEvent({
    required this.expeditionModel,
  });
}

class ChangeVoucherEvent extends PaymentDetailEvent {
  final VoucherModel voucherModel;

  const ChangeVoucherEvent({
    required this.voucherModel,
  });
}

class ChangePaymentMethodEvent extends PaymentDetailEvent {
  final PaymentMethodModel paymentMethodModel;

  const ChangePaymentMethodEvent({
    required this.paymentMethodModel,
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
