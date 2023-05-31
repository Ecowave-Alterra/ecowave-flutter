import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecowave/features/payment/model/entity/voucher_entity.dart';
import 'package:ecowave/features/payment/model/repository/voucher_repository.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final VoucherRepository repository;

  VoucherBloc(
    this.repository,
  ) : super(VoucherInitial()) {
    on<VoucherEvent>((event, emit) async {
      final response = await repository.getVouchers();
      response.fold(
        (failed) => emit(VoucherFailed(meesage: failed)),
        (result) => emit(VoucherSuccess(data: result)),
      );
    });
  }
}
