import 'package:ecowave/features/payment/model/models/payment_method_model.dart';
import 'package:ecowave/features/payment/model/services/payment_method_remote_datasource.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  final PaymentMethodService service;

  PaymentMethodBloc(
    this.service,
  ) : super(PaymentMethodInitial()) {
    on<GetPaymentMethodsEvent>((event, emit) async {
      try {
        final List<PaymentMethodModel> result =
            await service.getPaymentMethods();
        late List<PaymentMethodModel> ewallets;
        late List<PaymentMethodModel> bankTransfers;

        ewallets = result
            .where((element) => element.type == PaymentMethodType.eWallet)
            .toList();
        bankTransfers = result
            .where((element) => element.type == PaymentMethodType.bankTransfer)
            .toList();

        emit(PaymentMethodSuccess(
          ewallets: ewallets,
          bankTransfers: bankTransfers,
        ));
      } catch (e) {
        emit(PaymentMethodFailed(meesage: e.toString()));
      }
    });
  }
}
