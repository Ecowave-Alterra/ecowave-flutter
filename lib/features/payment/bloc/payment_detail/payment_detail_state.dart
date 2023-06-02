part of 'payment_detail_bloc.dart';

abstract class PaymentDetailState extends Equatable {
  const PaymentDetailState();

  @override
  List<Object> get props => [];
}

class PaymentDetailInitial extends PaymentDetailState {}

class PaymentDetailLoading extends PaymentDetailState {}

class PaymentDetailSuccess extends PaymentDetailState {
  final PaymentInfo data;

  const PaymentDetailSuccess({
    required this.data,
  });
}

class PaymentDetailFailed extends PaymentDetailState {
  final String meesage;

  const PaymentDetailFailed({
    required this.meesage,
  });
}
