import 'package:ecowave/features/information/model/models/information_model.dart';
import 'package:ecowave/features/information/model/services/bookmark_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IsBookmarkBloc extends Bloc<InformationModel, bool> {
  final BookmarkService service;
  IsBookmarkBloc(this.service) : super(false) {
    on<InformationModel>((event, emit) {
      try {
        final bool response = service.isBookmark(event);
        emit(response);
      } catch (e) {
        emit(false);
      }
    });
  }
}
