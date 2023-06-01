import 'package:ecowave/features/payment/bloc/shipping_address/shipping_address_bloc.dart';
import 'package:ecowave/features/payment/model/services/shipping_address_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => ShippingAddressBloc(locator()));

  // service
  locator.registerLazySingleton<ShippingAddressService>(
      () => ShippingAddressService());
}
