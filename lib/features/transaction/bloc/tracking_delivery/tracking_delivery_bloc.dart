import 'package:ecowave/features/transaction/model/models/tracking_delivery_model.dart';
import 'package:ecowave/features/transaction/model/services/history_transaction_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tracking_delivery_event.dart';
part 'tracking_delivery_state.dart';

class TrackingDeliveryBloc
    extends Bloc<TrackingDeliveryEvent, TrackingDeliveryState> {
  final HistoryTransactionService service;
  TrackingDeliveryBloc(this.service) : super(TrackingDeliveryInitial()) {
    on<GetTracingDeliveryEvent>((event, emit) async {
      emit(TrackingDeliveryLoading());
      try {
        final List<TrackingDeliveryModel>? trackingDelivery =
            await service.getTrackingDelivery(event.resi, event.cou);

        if (trackingDelivery == null) {
          emit(TrackingDeliveryEmpty());
        } else {
          emit(TrackingDeliverySuccess(dataTracking: trackingDelivery));
        }
      } catch (e) {
        emit(TrackingDeliveryFailed(message: e.toString()));
      }
    });
  }
}
