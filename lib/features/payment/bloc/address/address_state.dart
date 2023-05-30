part of 'address_bloc.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressSuccess extends AddressState {
  final List<AddressEntity> data;

  const AddressSuccess({
    required this.data,
  });
}

class AddressFailed extends AddressState {
  final String meesage;

  const AddressFailed({
    required this.meesage,
  });
}
