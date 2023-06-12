part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class GetAddressesEvent extends AddressEvent {}

class AddAddressesEvent extends AddressEvent {
  final AddressRequest request;
  const AddAddressesEvent({
    required this.request,
  });
}

class UpdateAddressesEvent extends AddressEvent {
  final int id;
  final AddressRequest request;
  const UpdateAddressesEvent({
    required this.id,
    required this.request,
  });
}
