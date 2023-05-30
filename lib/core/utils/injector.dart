import 'package:ecowave/features/payment/bloc/address/address_bloc.dart';
import 'package:ecowave/features/payment/model/datasource/address_remote_datasource.dart';
import 'package:ecowave/features/payment/model/repository/address_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => AddressBloc(locator()));

  // repository
  locator.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(locator()));

  // remote datasource
  locator.registerLazySingleton<AddressRemoteDatasource>(
      () => AddressRemoteDatasourceImpl());

  // local datasource
}
