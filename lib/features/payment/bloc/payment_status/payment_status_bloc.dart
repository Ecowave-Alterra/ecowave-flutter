import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecowave/features/payment/model/services/transaction_service.dart';

class PaymentStatusBloc extends Bloc<String, String> {
  final TransactionService service;

  PaymentStatusBloc(
    this.service,
  ) : super("initial") {
    on<String>((event, emit) async {
      final String result = await service.getPaymentStatus(event);
      emit(result);
    });
  }
}
