import 'package:ecowave/core/enums/data_state_status.dart';
import 'package:ecowave/features/ecommerce/model/product_model.dart';
import 'package:ecowave/features/payment/model/models/expedition_model.dart';
import 'package:ecowave/features/payment/model/models/payment_method_model.dart';
import 'package:ecowave/features/payment/model/models/shipping_address_model.dart';
import 'package:ecowave/features/payment/model/models/voucher_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_detail_event.dart';
part 'payment_detail_state.dart';

class PaymentDetailBloc extends Bloc<PaymentDetailEvent, PaymentDetailState> {
  PaymentDetailBloc() : super(const PaymentDetailState()) {
    on<ChangeShippingAddressEvent>((event, emit) {
      emit(state.copyWith(
        status: DataStateStatus.isSuccess,
        shippingAddressModel: event.shippingAddressModel,
      ));
    });

    on<ChangeExpeditionEvent>((event, emit) {
      emit(state.copyWith(
        status: DataStateStatus.isSuccess,
        expeditionModel: event.expeditionModel,
      ));
    });

    on<ChangeVoucherEvent>((event, emit) {
      emit(state.copyWith(
        status: DataStateStatus.isSuccess,
        voucherModel: event.voucherModel,
      ));
    });
  }
}
