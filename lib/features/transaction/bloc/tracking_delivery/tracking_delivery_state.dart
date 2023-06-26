part of 'tracking_delivery_bloc.dart';

abstract class TrackingDeliveryState extends Equatable {
  const TrackingDeliveryState();

  @override
  List<Object> get props => [];
}

class TrackingDeliveryInitial extends TrackingDeliveryState {}

class TrackingDeliveryLoading extends TrackingDeliveryState {}

class TrackingDeliveryEmpty extends TrackingDeliveryState {}

class TrackingDeliverySuccess extends TrackingDeliveryState {
  final List<TrackingDeliveryModel> dataTracking;

  const TrackingDeliverySuccess({
    required this.dataTracking,
  });
}

class TrackingDeliveryFailed extends TrackingDeliveryState {
  final String message;

  const TrackingDeliveryFailed({
    required this.message,
  });
}
