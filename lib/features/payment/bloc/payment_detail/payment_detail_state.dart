part of 'payment_detail_bloc.dart';

class PaymentDetailState {
  final DataStateStatus status;
  final AddressModel? addressModel;
  final List<CartModel>? carts;
  final int? productsPrice;
  final ExpeditionModel? expeditionModel;
  final VoucherModel? voucherModel;
  final PaymentInfo? paymentInfo;
  final int pointUsed;
  final TransactionModel? transactionModel;
  final String errorMessage;

  const PaymentDetailState({
    this.status = DataStateStatus.initial,
    this.addressModel,
    this.carts,
    this.productsPrice,
    this.expeditionModel,
    this.voucherModel,
    this.paymentInfo,
    this.pointUsed = 0,
    this.transactionModel,
    this.errorMessage = "",
  });

  PaymentDetailState copyWith({
    DataStateStatus? status,
    AddressModel? addressModel,
    List<CartModel>? carts,
    int? productsPrice,
    ExpeditionModel? expeditionModel,
    VoucherModel? voucherModel,
    int? pointUsed,
    String? errorMessage,
  }) {
    return PaymentDetailState(
      status: status ?? this.status,
      addressModel: addressModel ?? this.addressModel,
      carts: carts ?? this.carts,
      productsPrice: productsPrice ?? this.productsPrice,
      expeditionModel: expeditionModel ?? this.expeditionModel,
      voucherModel: voucherModel ?? this.voucherModel,
      errorMessage: errorMessage ?? this.errorMessage,
      paymentInfo: PaymentInfo(
        productPrice: productsPrice ?? this.productsPrice ?? 0,
        shippingPrice:
            expeditionModel?.price ?? this.expeditionModel?.price ?? 0,
        pointUsed: pointUsed ?? this.pointUsed,
        voucher: voucherModel ?? this.voucherModel,
      ),
      pointUsed: pointUsed ?? this.pointUsed,
    );
  }
}
