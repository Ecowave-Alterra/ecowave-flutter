part of 'payment_detail_bloc.dart';

class PaymentDetailState {
  final DataStateStatus status;
  final ShippingAddressModel? shippingAddressModel;
  final ExpeditionModel? expeditionModel;
  final VoucherModel? voucherModel;

  const PaymentDetailState({
    this.status = DataStateStatus.isInitial,
    this.shippingAddressModel,
    this.expeditionModel,
    this.voucherModel,
  });

  PaymentDetailState copyWith({
    DataStateStatus? status,
    ShippingAddressModel? shippingAddressModel,
    ExpeditionModel? expeditionModel,
    VoucherModel? voucherModel,
  }) {
    return PaymentDetailState(
      status: status ?? this.status,
      shippingAddressModel: shippingAddressModel ?? this.shippingAddressModel,
      expeditionModel: expeditionModel ?? this.expeditionModel,
      voucherModel: voucherModel ?? this.voucherModel,
    );
  }
}
