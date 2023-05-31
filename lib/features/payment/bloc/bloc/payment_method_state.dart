part of 'payment_method_bloc.dart';

abstract class PaymentMethodState extends Equatable {
  const PaymentMethodState();

  @override
  List<Object> get props => [];
}

class PaymentMethodInitial extends PaymentMethodState {}

class PaymentMethodLoading extends PaymentMethodState {}

class PaymentMethodSuccess extends PaymentMethodState {
  final List<PaymentMethodEntity> ewallets;
  final List<PaymentMethodEntity> bankTransfers;

  const PaymentMethodSuccess({
    required this.ewallets,
    required this.bankTransfers,
  });
}

class PaymentMethodFailed extends PaymentMethodState {
  final String meesage;

  const PaymentMethodFailed({
    required this.meesage,
  });
}
