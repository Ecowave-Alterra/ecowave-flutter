import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecowave/features/payment/model/services/get_point_service.dart';

class GetPointBloc extends Bloc<int, int> {
  final GetPointService service;

  GetPointBloc(
    this.service,
  ) : super(0) {
    on<int>((event, emit) async {
      final int result = await service.getPoint();
      emit(result);
    });
  }
}
