import 'package:ecowave/features/payment/bloc/address/address_bloc.dart';
import 'package:ecowave/features/payment/bloc/bloc/payment_method_bloc.dart';
import 'package:ecowave/features/payment/model/datasource/address_remote_datasource.dart';
import 'package:ecowave/features/payment/model/datasource/payment_method_remote_datasource.dart';
import 'package:ecowave/features/payment/model/repository/address_repository.dart';
import 'package:ecowave/features/payment/model/repository/payment_method_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => AddressBloc(locator()));
  locator.registerFactory(() => PaymentMethodBloc(locator()));

  // repository
  locator.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(locator()));
  locator.registerLazySingleton<PaymentMethodRepository>(
      () => PaymentMethodRepositoryImpl(locator()));

  // remote datasource
  locator.registerLazySingleton<AddressRemoteDatasource>(
      () => AddressRemoteDatasourceImpl());
  locator.registerLazySingleton<PaymentMethodRemoteDatasource>(
      () => PaymentMethodRemoteDatasourceImpl());

  // local datasource
}
