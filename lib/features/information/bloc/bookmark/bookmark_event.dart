part of 'bookmark_bloc.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class AddBookmarkEvent extends BookmarkEvent {
  final InformationModel informationModel;
  const AddBookmarkEvent({
    required this.informationModel,
  });
}

class DeleteBookmarkEvent extends BookmarkEvent {
  final int id;
  const DeleteBookmarkEvent({
    required this.id,
  });
}
