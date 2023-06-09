import 'package:ecowave/features/address/model/models/address_model.dart';
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
      try {
        final List<AddressModel> result = await service.getAddresses();
        emit(AddressSuccess(data: result));
      } catch (e) {
        emit(AddressFailed(meesage: e.toString()));
      }
    });
  }
}
