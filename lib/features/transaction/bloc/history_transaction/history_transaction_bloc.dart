import 'package:ecowave/features/transaction/model/models/history_transaction.dart';
import 'package:ecowave/features/transaction/model/services/history_transaction_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_transaction_event.dart';
part 'history_transaction_state.dart';

class HistoryTransactionBloc
    extends Bloc<HistoryTransactionEvent, HistoryTransactionState> {
  final HistoryTransactionService service;

  HistoryTransactionBloc(this.service) : super(HistoryTransactionInitial()) {
    on<GetHistoryTransactionEvent>((event, emit) async {
      try {
        final List<HistoryTransactionModel> resultUnpaid =
            await service.getAllHistoryTransactionUnpaid();
        final List<HistoryTransactionModel> resultSending =
            await service.getAllHistoryTransactionSending();
        final List<HistoryTransactionModel> resultPacked =
            await service.getAllHistoryTransactionPacked();
        final List<HistoryTransactionModel> resultSuccess =
            await service.getAllHistoryTransactionSuccess();
        final List<HistoryTransactionModel> resultFailed =
            await service.getAllHistoryTransactionFailed();

        // print("Result ini isinya apa $resultUnpaid");
        emit(HistoryTransactionSuccess(
            dataUnpaid: resultUnpaid,
            dataFailed: resultFailed,
            dataPacked: resultPacked,
            dataSending: resultSending,
            dataSuccess: resultSuccess));
      } catch (e) {
        emit(HistoryTransactionFailed(message: e.toString()));
      }
    });
  }
}
