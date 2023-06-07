part of 'history_transaction_bloc.dart';

abstract class HistoryTransactionState extends Equatable {
  const HistoryTransactionState();

  @override
  List<Object> get props => [];
}

class HistoryTransactionInitial extends HistoryTransactionState {}

class HistoryTransactionLoading extends HistoryTransactionState {}

class HistoryTransactionSuccess extends HistoryTransactionState {
  final List<HistoryTransactionModel> dataUnpaid;
  final List<HistoryTransactionModel> dataSending;
  final List<HistoryTransactionModel> dataPacked;
  final List<HistoryTransactionModel> dataSuccess;
  final List<HistoryTransactionModel> dataFailed;

  const HistoryTransactionSuccess({
    required this.dataUnpaid,
    required this.dataSending,
    required this.dataPacked,
    required this.dataSuccess,
    required this.dataFailed,
  });
}

class HistoryTransactionFailed extends HistoryTransactionState {
  final String message;

  const HistoryTransactionFailed({
    required this.message,
  });
}
