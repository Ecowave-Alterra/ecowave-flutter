import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecowave/features/payment/model/entity/expedition_entity.dart';
import 'package:ecowave/features/payment/model/repository/expedition_repository.dart';

part 'expedition_event.dart';
part 'expedition_state.dart';

class ExpeditionBloc extends Bloc<ExpeditionEvent, ExpeditionState> {
  final ExpeditionRepository repository;

  ExpeditionBloc(
    this.repository,
  ) : super(ExpeditionInitial()) {
    on<GetExpeditionsEvent>((event, emit) async {
      final response = await repository.getaddreses();
      response.fold(
        (failed) => emit(ExpeditionFailed(meesage: failed)),
        (result) => emit(ExpeditionSuccess(data: result)),
      );
    });
  }
}
