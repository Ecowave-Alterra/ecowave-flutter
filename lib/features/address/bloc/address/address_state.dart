part of 'address_bloc.dart';

abstract class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressSuccess extends AddressState {
  final List<ProvinceModel>? provinces;
  final List<CityModel>? cities;
  final List<AddressModel>? addresses;

  const AddressSuccess({
    this.provinces,
    this.cities,
    this.addresses,
  });

  @override
  List<Object> get props => [provinces!, cities ?? [], addresses!];

  AddressSuccess copyWith({
    List<ProvinceModel>? provinces,
    List<CityModel>? cities,
    List<AddressModel>? addresses,
  }) {
    return AddressSuccess(
      provinces: provinces ?? this.provinces,
      cities: cities ?? this.cities,
      addresses: addresses ?? this.addresses,
    );
  }
}

class AddressFailed extends AddressState {
  final String meesage;

  const AddressFailed({
    required this.meesage,
  });
}
