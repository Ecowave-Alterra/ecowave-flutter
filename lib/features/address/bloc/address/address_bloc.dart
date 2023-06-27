import 'package:ecowave/features/address/model/models/address_model.dart';
import 'package:ecowave/features/address/model/models/address_request.dart';
import 'package:ecowave/features/address/model/models/city_model.dart';
import 'package:ecowave/features/address/model/models/province_model.dart';
import 'package:ecowave/features/address/model/services/address_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'address_state.dart';
part 'address_event.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressService service;

  AddressBloc(
    this.service,
  ) : super(AddressInitial()) {
    on<GetAddressesEvent>((event, emit) async {
      emit(AddressLoading());
      try {
        final List<ProvinceModel> provinces = await service.getProvinces();
        final List<AddressModel> addresses = await service.getAddresses();
        emit(AddressSuccess(
          provinces: provinces,
          addresses: addresses,
          cities: const [],
        ));
      } catch (e) {
        emit(AddressFailed(meesage: e.toString()));
      }
    });

    on<GetCityEvent>((event, emit) async {
      try {
        final AddressSuccess currentState = state as AddressSuccess;
        final List<CityModel> cities =
            await service.getCities(event.provinceId);
        emit(currentState.copyWith(
          cities: cities,
        ));
      } catch (e) {
        emit(AddressFailed(meesage: e.toString()));
      }
    });

    on<AddAddressesEvent>((event, emit) async {
      try {
        final bool isCreated = await service.createAddresses(event.request);
        if (isCreated) {
          emit((state as AddressSuccess).copyWith(
            isUpdated: true,
            messageUpdated: "Yey! Kamu berhasil menambahkan alamat",
          ));
          add(GetAddressesEvent());
        } else {
          emit(const AddressFailed(
              meesage: "Gagal menyimpan alamat, silahkan coba lagi nanti"));
        }
      } catch (e) {
        emit(AddressFailed(meesage: e.toString()));
      }
    });

    on<UpdateAddressesEvent>((event, emit) async {
      try {
        final bool isUpdated =
            await service.updateAddresses(event.id, event.request);
        if (isUpdated) {
          emit((state as AddressSuccess).copyWith(
            isUpdated: true,
            messageUpdated: "Yey! Kamu berhasil memperbarui alamat",
          ));
          add(GetAddressesEvent());
        } else {
          emit(const AddressFailed(
              meesage: "Gagal memperbarui alamat, silahkan coba lagi nanti"));
        }
      } catch (e) {
        emit(AddressFailed(meesage: e.toString()));
      }
    });
  }
}
