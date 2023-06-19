part of 'tracking_delivery_bloc.dart';

abstract class TrackingDeliveryEvent extends Equatable {
  const TrackingDeliveryEvent();

  @override
  List<Object> get props => [];
}

class GetTracingDeliveryEvent extends TrackingDeliveryEvent {
  final String resi;
  final String cou;
  const GetTracingDeliveryEvent({required this.resi, required this.cou});
}
