part of 'payment_detail_bloc.dart';

abstract class PaymentDetailEvent extends Equatable {
  const PaymentDetailEvent();

  @override
  List<Object> get props => [];
}

class ChangeShippingAddressEvent extends PaymentDetailEvent {
  final AddressModel addressModel;

  const ChangeShippingAddressEvent({
    required this.addressModel,
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

class PointUsedEvent extends PaymentDetailEvent {
  final int pointUsed;

  const PointUsedEvent({
    required this.pointUsed,
  });
}

class CheckoutEvent extends PaymentDetailEvent {
  final AddressModel addressModel;
  final PaymentMethodModel paymentMethodModel;
  final ExpeditionModel expeditionModel;
  final VoucherModel? voucherModel;
  final List<ProductModel> products;
  final int? pointUsed;
  final int totalPayment;

  const CheckoutEvent({
    required this.addressModel,
    required this.paymentMethodModel,
    required this.expeditionModel,
    required this.voucherModel,
    required this.products,
    required this.pointUsed,
    required this.totalPayment,
  });
}
