part of 'history_transaction_bloc.dart';

abstract class HistoryTransactionEvent extends Equatable {
  const HistoryTransactionEvent();

  @override
  List<Object> get props => [];
}

class GetHistoryTransactionEvent extends HistoryTransactionEvent {
  const GetHistoryTransactionEvent();
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

  const PostRatingDataEvent(this.ratingDataList, this.expeditionRating);
}
