import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecowave/features/payment/model/entity/payment_method_entity.dart';
import 'package:ecowave/features/payment/model/repository/payment_method_repository.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  final PaymentMethodRepository repository;

  PaymentMethodBloc(
    this.repository,
  ) : super(PaymentMethodInitial()) {
    on<GetPaymentMethodsEvent>((event, emit) async {
      final response = await repository.getPaymentMethods();
      response.fold((failed) => emit(PaymentMethodFailed(meesage: failed)),
          (result) {
        late List<PaymentMethodEntity> ewallets;
        late List<PaymentMethodEntity> bankTransfers;

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
      });
    });
  }
}
