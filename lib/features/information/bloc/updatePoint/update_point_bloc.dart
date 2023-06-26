import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/services/information_service.dart';

part 'update_point_event.dart';
part 'update_point_state.dart';

class UpdatePointBloc extends Bloc<UpdatePointEvent, UpdatePointState> {
  final InformationService service;
  UpdatePointBloc(this.service) : super(UpdatePointInitial()) {
    on<GetMessageEvent>((event, emit) async {
      try {
        final String result = await service.getPoint();
        emit(UpdatePointSuccess(message: result));
      } catch (e) {
        emit(UpdatePointError(message: e.toString()));
      }
    });
  }
}
