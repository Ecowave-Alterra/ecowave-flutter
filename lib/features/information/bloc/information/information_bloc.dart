import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecowave/features/information/model/models/information_model.dart';
import 'package:ecowave/features/information/model/services/information_service.dart';
import 'package:equatable/equatable.dart';

part 'information_event.dart';
part 'information_state.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  final InformationService service;
  InformationBloc(this.service) : super(InformationInitial()) {
    on<GetInformationEvent>((event, emit) async {
      try {
        emit(InformationLoading());
        final List<InformationModel> result =
            await service.getInformation(id: event.id);

        emit(InformationSuccess(data: result));
      } catch (e) {
        emit(InformationError(message: e.toString()));
      }
    });
  }
}
