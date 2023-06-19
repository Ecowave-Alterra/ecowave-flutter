part of 'payment_detail_bloc.dart';

abstract class PaymentDetailEvent extends Equatable {
  const PaymentDetailEvent();

  @override
  List<Object> get props => [];
}

class GetCartsEvent extends PaymentDetailEvent {
  final List<CartModel> carts;

  const GetCartsEvent({
    required this.carts,
  });
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

class PointUsedEvent extends PaymentDetailEvent {
  final int pointUsed;

  const PointUsedEvent({
    required this.pointUsed,
  });
}

class CheckoutEvent extends PaymentDetailEvent {
  final TransactionRequest request;

  const CheckoutEvent({
    required this.request,
  });
}
