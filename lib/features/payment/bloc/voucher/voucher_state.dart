part of 'voucher_bloc.dart';

abstract class VoucherState extends Equatable {
  const VoucherState();

  @override
  List<Object> get props => [];
}

class VoucherInitial extends VoucherState {}

class VoucherLoading extends VoucherState {}

class VoucherSuccess extends VoucherState {
  final List<VoucherModel> data;

  const VoucherSuccess({
    required this.data,
  });
}

class VoucherFailed extends VoucherState {
  final String meesage;

  const VoucherFailed({
    required this.meesage,
  });
}
