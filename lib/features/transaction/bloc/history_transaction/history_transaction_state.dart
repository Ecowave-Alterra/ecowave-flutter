part of 'history_transaction_bloc.dart';

abstract class HistoryTransactionState extends Equatable {
  const HistoryTransactionState();

  @override
  List<Object> get props => [];
}

class HistoryTransactionInitial extends HistoryTransactionState {}

class HistoryTransactionEmpty extends HistoryTransactionState {}

class HistoryTransactionLoading extends HistoryTransactionState {}

class HistoryUnpaidTransactionSuccess extends HistoryTransactionState {
  final List<HistoryTransactionModel> dataUnpaid;

  const HistoryUnpaidTransactionSuccess({
    required this.dataUnpaid,
  });
}

class HistoryPackedTransactionSuccess extends HistoryTransactionState {
  final List<HistoryTransactionModel> dataPacked;

  const HistoryPackedTransactionSuccess({
    required this.dataPacked,
  });
}

class HistorySendingTransactionSuccess extends HistoryTransactionState {
  final List<HistoryTransactionModel> dataSending;

  const HistorySendingTransactionSuccess({
    required this.dataSending,
  });
}

class HistorySuccessTransactionSuccess extends HistoryTransactionState {
  final List<HistoryTransactionModel> dataSuccess;

  const HistorySuccessTransactionSuccess({
    required this.dataSuccess,
  });
}

class HistoryFailedTransactionSuccess extends HistoryTransactionState {
  final List<HistoryTransactionModel> dataFailed;

  const HistoryFailedTransactionSuccess({
    required this.dataFailed,
  });
}

class HistoryTransactionFailed extends HistoryTransactionState {
  final String message;

  const HistoryTransactionFailed({
    required this.message,
  });
}
