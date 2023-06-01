import 'package:ecowave/features/payment/model/models/shipping_address_model.dart';
import 'package:ecowave/features/payment/model/services/shipping_address_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shipping_address_state.dart';
part 'shipping_address_event.dart';

class ShippingAddressBloc
    extends Bloc<ShippingAddressEvent, ShippingAddressState> {
  final ShippingAddressService service;

  ShippingAddressBloc(
    this.service,
  ) : super(ShippingAddressInitial()) {
    on<GetShippingAddressesEvent>((event, emit) async {
      try {
        final List<ShippingAddressModel> result = await service.getAddresses();
        emit(ShippingAddressSuccess(data: result));
      } catch (e) {
        emit(ShippingAddressFailed(meesage: e.toString()));
      }
    });
  }
}
