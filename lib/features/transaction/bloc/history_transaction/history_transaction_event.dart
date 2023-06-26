part of 'history_transaction_bloc.dart';

abstract class HistoryTransactionEvent extends Equatable {
  const HistoryTransactionEvent();

  @override
  List<Object> get props => [];
}

class GetHistoryUnpaidTransactionEvent extends HistoryTransactionEvent {
  const GetHistoryUnpaidTransactionEvent();
}

class GetHistoryPackedTransactionEvent extends HistoryTransactionEvent {
  const GetHistoryPackedTransactionEvent();
}

class GetHistorySendingTransactionEvent extends HistoryTransactionEvent {
  const GetHistorySendingTransactionEvent();
}

class GetHistorySuccessTransactionEvent extends HistoryTransactionEvent {
  const GetHistorySuccessTransactionEvent();
}

class GetHistoryFailedTransactionEvent extends HistoryTransactionEvent {
  const GetHistoryFailedTransactionEvent();
}

class AddCancelTransactionEvent extends HistoryTransactionEvent {
  final String transactionId;
  const AddCancelTransactionEvent(this.transactionId);
}

class AddCancelTransactionCommentEvent extends HistoryTransactionEvent {
  final String message;
  final String transactionId;
  const AddCancelTransactionCommentEvent(
    this.message,
    this.transactionId,
  );
}

class AddConfirmTransactionEvent extends HistoryTransactionEvent {
  final String transactionId;
  const AddConfirmTransactionEvent(
    this.transactionId,
  );
}

class PostRatingDataEvent extends HistoryTransactionEvent {
  final List<RatingData> ratingDataList;
  final double expeditionRating;
  final String transactionId;

  const PostRatingDataEvent(
      {required this.ratingDataList,
      required this.expeditionRating,
      required this.transactionId});
}
