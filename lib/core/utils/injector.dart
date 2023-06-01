import 'package:ecowave/features/payment/bloc/payment_method/payment_method_bloc.dart';
import 'package:ecowave/features/payment/bloc/shipping_address/shipping_address_bloc.dart';
import 'package:ecowave/features/payment/model/services/payment_method_remote_datasource.dart';
import 'package:ecowave/features/payment/model/services/shipping_address_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => ShippingAddressBloc(locator()));
  locator.registerFactory(() => PaymentMethodBloc(locator()));

  // service
  locator.registerLazySingleton<ShippingAddressService>(
      () => ShippingAddressService());
  locator.registerLazySingleton<PaymentMethodService>(
      () => PaymentMethodService());
}
