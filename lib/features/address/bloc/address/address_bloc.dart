import 'package:ecowave/features/address/model/models/address_model.dart';
import 'package:ecowave/features/address/model/models/address_request.dart';
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
        final List<AddressModel> result = await service.getAddresses();
        emit(AddressSuccess(data: result));
        print(result);
      } catch (e) {
        emit(AddressFailed(meesage: e.toString()));
      }
    });

    on<AddAddressesEvent>((event, emit) async {
      emit(AddressLoading());
      try {
        final bool isCreated = await service.createAddresses(event.request);
        if (isCreated) {
          add(GetAddressesEvent());
          print("created: ${event.request.toJson()}");
        } else {
          emit(const AddressFailed(
              meesage: "Gagal menyimpan alamat, silahkan coba lagi nanti"));
        }
      } catch (e) {
        emit(AddressFailed(meesage: e.toString()));
      }
    });
  }
}
