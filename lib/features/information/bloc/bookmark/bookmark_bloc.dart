import 'package:bloc/bloc.dart';
import 'package:ecowave/features/information/model/services/bookmark_storage.dart';
import 'package:equatable/equatable.dart';

import '../../model/models/information_model.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final BookmarkService service = BookmarkService();
  BookmarkBloc() : super(BookmarkInitial()) {
    on<AddBookmarkEvent>((event, emit) {
      emit(BookmarkLoading());
      service.addItem(event.informationModel);
      emit(BookmarkSuccess(data: service.items));
    });
    on<DeleteBookmarkEvent>((event, emit) {
      emit(BookmarkLoading());
      service.deleteItem(event.id);
      emit(BookmarkSuccess(data: service.items));
    });
  }
}
