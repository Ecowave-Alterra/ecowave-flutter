import 'package:ecowave/features/payment/model/models/voucher_model.dart';
import 'package:ecowave/features/payment/model/services/voucher_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final VoucherService service;

  VoucherBloc(
    this.service,
  ) : super(VoucherInitial()) {
    on<VoucherEvent>((event, emit) async {
      try {
        final List<VoucherModel> result = await service.getVouchers();
        result.sort((a, b) => a.minimumPurchase.compareTo(b.minimumPurchase));
        emit(VoucherSuccess(data: result));
      } catch (e) {
        emit(VoucherFailed(meesage: e.toString()));
      }
    });
  }
}
