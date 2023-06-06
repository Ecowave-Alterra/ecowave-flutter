part of 'payment_detail_bloc.dart';

class PaymentDetailState {
  final DataStateStatus status;
  final ShippingAddressModel? shippingAddressModel;
  final ExpeditionModel? expeditionModel;
  final VoucherModel? voucherModel;
  final PaymentMethodModel? paymentMethodModel;
  final PaymentInfo? paymentInfo;

  const PaymentDetailState({
    this.status = DataStateStatus.initial,
    this.shippingAddressModel,
    this.expeditionModel,
    this.voucherModel,
    this.paymentMethodModel,
    this.paymentInfo,
  });

  PaymentDetailState copyWith({
    DataStateStatus? status,
    ShippingAddressModel? shippingAddressModel,
    ExpeditionModel? expeditionModel,
    VoucherModel? voucherModel,
    PaymentMethodModel? paymentMethodModel,
  }) {
    return PaymentDetailState(
      status: status ?? this.status,
      shippingAddressModel: shippingAddressModel ?? this.shippingAddressModel,
      expeditionModel: expeditionModel ?? this.expeditionModel,
      voucherModel: voucherModel ?? this.voucherModel,
      paymentMethodModel: paymentMethodModel ?? this.paymentMethodModel,
      paymentInfo: PaymentInfo(
        productPrice: 89000,
        shippingPrice:
            expeditionModel?.price ?? this.expeditionModel?.price ?? 0,
        pointUsed: 0,
        voucher: voucherModel ?? this.voucherModel,
      ),
    );
  }
}
