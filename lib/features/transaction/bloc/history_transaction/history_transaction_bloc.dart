import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
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
      emit(HistoryTransactionLoading());
      try {
        final List<HistoryTransactionModel> transactionModelUnpaid =
            await service.getTransactions("Belum Bayar");

        final List<HistoryTransactionModel> transactionModelSending =
            await service.getTransactions("Dikirim");
        final List<HistoryTransactionModel> transactionModelPacked =
            await service.getTransactions("Dikemas");
        final List<HistoryTransactionModel> transactionModelSuccess =
            await service.getTransactions("Selesai");
        final List<HistoryTransactionModel> transactionModelFailed =
            await service.getTransactions("Dibatalkan");
        // print("sasasasa $transactionModelFailed");
        emit(HistoryTransactionSuccess(
          dataUnpaid: transactionModelUnpaid,
          dataSending: transactionModelSending,
          dataPacked: transactionModelPacked,
          dataSuccess: transactionModelSuccess,
          dataFailed: transactionModelFailed,
        ));
      } catch (e) {
        emit(HistoryTransactionFailed(message: e.toString()));
      }
    });

    on<AddCancelTransactionEvent>((event, emit) async {
      emit(HistoryTransactionLoading());
      try {
        await service.postCancelTransaction(event.transactionId);
      } catch (e) {
        emit(HistoryTransactionFailed(message: e.toString()));
      }
    });

    on<AddCancelTransactionCommentEvent>((event, emit) async {
      emit(HistoryTransactionLoading());
      try {
        await service.postCancelTransactionComment(
            event.message, event.transactionId);
      } catch (e) {
        emit(HistoryTransactionFailed(message: e.toString()));
      }
    });

    on<AddConfirmTransactionEvent>((event, emit) async {
      emit(HistoryTransactionLoading());
      try {
        await service.confirmTransaction(event.transactionId);
      } catch (e) {
        emit(HistoryTransactionFailed(message: e.toString()));
      }
    });

    on<PostRatingDataEvent>((event, emit) async {
      emit(HistoryTransactionLoading());
      try {
        await service.postRatingData(
            event.ratingDataList, event.expeditionRating);
      } catch (e) {
        emit(HistoryTransactionFailed(message: e.toString()));
      }
    });
  }
}
