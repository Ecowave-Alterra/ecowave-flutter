import 'package:ecowave/features/information/model/services/bookmark_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/models/information_model.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final BookmarkService service;
  BookmarkBloc(this.service) : super(BookmarkInitial()) {
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
