import 'package:ecowave/features/payment/model/models/expedition_model.dart';
import 'package:ecowave/features/payment/model/models/expedition_request.dart';
import 'package:ecowave/features/payment/model/services/expedition_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'expedition_event.dart';
part 'expedition_state.dart';

class ExpeditionBloc extends Bloc<ExpeditionEvent, ExpeditionState> {
  final ExpeditionService service;

  ExpeditionBloc(
    this.service,
  ) : super(ExpeditionInitial()) {
    on<GetExpeditionsEvent>((event, emit) async {
      try {
        final List<ExpeditionModel> result =
            await service.getExpeditions(event.request);
        emit(ExpeditionSuccess(data: result));
      } catch (e) {
        emit(ExpeditionFailed(meesage: e.toString()));
      }
    });
  }
}
