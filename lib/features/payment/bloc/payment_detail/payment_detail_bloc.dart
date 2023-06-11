import 'package:ecowave/core.dart';
import 'package:ecowave/features/cart/model/models/cart_model.dart';
import 'package:ecowave/features/payment/model/models/expedition_model.dart';
import 'package:ecowave/features/payment/model/models/payment_info.dart';
import 'package:ecowave/features/payment/model/models/payment_method_model.dart';
import 'package:ecowave/features/address/model/models/address_model.dart';
import 'package:ecowave/features/payment/model/models/voucher_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_detail_event.dart';
part 'payment_detail_state.dart';

class PaymentDetailBloc extends Bloc<PaymentDetailEvent, PaymentDetailState> {
  PaymentDetailBloc() : super(const PaymentDetailState().copyWith()) {
    on<GetCartsEvent>((event, emit) {
      int productsPrice = 0;
      for (CartModel element in event.carts) {
        productsPrice += element.totalPrice;
      }

      emit(state.copyWith(
        status: DataStateStatus.success,
        carts: event.carts,
        productsPrice: productsPrice,
      ));
    });

    on<ChangeShippingAddressEvent>((event, emit) {
      emit(state.copyWith(
        status: DataStateStatus.success,
        addressModel: event.addressModel,
      ));
    });

    on<ChangeExpeditionEvent>((event, emit) {
      emit(state.copyWith(
        status: DataStateStatus.success,
        expeditionModel: event.expeditionModel,
      ));
    });

    on<ChangeVoucherEvent>((event, emit) {
      emit(state.copyWith(
        status: DataStateStatus.success,
        voucherModel: event.voucherModel,
      ));
    });

    on<ChangePaymentMethodEvent>((event, emit) {
      emit(state.copyWith(
        status: DataStateStatus.success,
        paymentMethodModel: event.paymentMethodModel,
      ));
    });

    on<PointUsedEvent>((event, emit) {
      emit(state.copyWith(
        status: DataStateStatus.success,
        pointUsed: -event.pointUsed,
      ));
    });

    on<CheckoutEvent>((event, emit) {
      emit(const PaymentDetailState());
    });
  }
}
