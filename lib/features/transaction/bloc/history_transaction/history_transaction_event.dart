part of 'history_transaction_bloc.dart';

abstract class HistoryTransactionEvent extends Equatable {
  const HistoryTransactionEvent();

  @override
  List<Object> get props => [];
}

class GetHistoryTransactionEvent extends HistoryTransactionEvent {}
