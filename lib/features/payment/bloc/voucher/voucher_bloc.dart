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
        emit(VoucherLoading());
        final List<VoucherModel> result = await service.getVouchers();
        final List<VoucherModel> voucherActive = result
            .where((element) =>
                DateTime.now().isAfter(DateTime.parse(element.startDate)) &&
                DateTime.now().isBefore(DateTime.parse(element.endDate)))
            .toList();
        voucherActive.sort((a, b) =>
            (a.minimumPurchase ?? 0).compareTo(b.minimumPurchase ?? 0));
        emit(VoucherSuccess(data: voucherActive));
      } catch (e) {
        emit(VoucherFailed(meesage: e.toString()));
      }
    });
  }
}
