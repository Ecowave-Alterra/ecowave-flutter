import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:ecowave/features/transaction/model/models/rating_data_model.dart';
import 'package:ecowave/features/transaction/model/services/history_transaction_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_transaction_event.dart';
part 'history_transaction_state.dart';

class HistoryTransactionBloc
    extends Bloc<HistoryTransactionEvent, HistoryTransactionState> {
  final HistoryTransactionService service;

  HistoryTransactionBloc(this.service) : super(HistoryTransactionInitial()) {
    on<GetHistoryUnpaidTransactionEvent>((event, emit) async {
      emit(HistoryTransactionLoading());
      try {
        final List<HistoryTransactionModel>? transactionModelPacked =
            await service.getTransactions("Belum Bayar");

        if (transactionModelPacked == null || transactionModelPacked.isEmpty) {
          emit(HistoryTransactionEmpty());
        } else {
          emit(HistoryUnpaidTransactionSuccess(
            dataUnpaid: transactionModelPacked,
          ));
        }
      } catch (e) {
        emit(HistoryTransactionFailed(message: e.toString()));
      }
    });

    on<GetHistoryPackedTransactionEvent>((event, emit) async {
      emit(HistoryTransactionLoading());
      try {
        final List<HistoryTransactionModel>? transactionModelPacked =
            await service.getTransactions("Dikemas");

        if (transactionModelPacked == null || transactionModelPacked.isEmpty) {
          emit(HistoryTransactionEmpty());
        } else {
          emit(HistoryPackedTransactionSuccess(
            dataPacked: transactionModelPacked,
          ));
        }
      } catch (e) {
        emit(HistoryTransactionFailed(message: e.toString()));
      }
    });

    on<GetHistorySendingTransactionEvent>((event, emit) async {
      emit(HistoryTransactionLoading());
      try {
        final List<HistoryTransactionModel>? transactionModelSending =
            await service.getTransactions("Dikirim");

        if (transactionModelSending == null ||
            transactionModelSending.isEmpty) {
          emit(HistoryTransactionEmpty());
        } else {
          emit(HistorySendingTransactionSuccess(
            dataSending: transactionModelSending,
          ));
        }
      } catch (e) {
        emit(HistoryTransactionFailed(message: e.toString()));
      }
    });

    on<GetHistorySuccessTransactionEvent>((event, emit) async {
      emit(HistoryTransactionLoading());
      try {
        final List<HistoryTransactionModel>? transactionModelSuccess =
            await service.getTransactions("Selesai");

        if (transactionModelSuccess == null ||
            transactionModelSuccess.isEmpty) {
          emit(HistoryTransactionEmpty());
        } else {
          emit(HistorySuccessTransactionSuccess(
            dataSuccess: transactionModelSuccess,
          ));
        }
      } catch (e) {
        emit(HistoryTransactionFailed(message: e.toString()));
      }
    });

    on<GetHistoryFailedTransactionEvent>((event, emit) async {
      emit(HistoryTransactionLoading());
      try {
        final List<HistoryTransactionModel>? transactionModelFailed =
            await service.getTransactions("Dibatalkan");

        if (transactionModelFailed == null || transactionModelFailed.isEmpty) {
          emit(HistoryTransactionEmpty());
        } else {
          emit(HistoryFailedTransactionSuccess(
            dataFailed: transactionModelFailed,
          ));
        }
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
      try {
        final bool isRating = await service.postRatingData(
            event.ratingDataList, event.expeditionRating, event.transactionId);
        if (isRating) {
          emit((state as HistorySuccessTransactionSuccess).copyWith(
            isUpdated: true,
            messageUpdated: "Yey! Kamu mendapatkan point +10",
          ));
          add(const GetHistorySuccessTransactionEvent());
        }
      } catch (e) {
        emit(HistoryTransactionFailed(message: e.toString()));
      }
    });
  }
}
