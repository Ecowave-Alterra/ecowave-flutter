import 'package:ecowave/features/payment/bloc/address/address_bloc.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/payment/model/datasource/address_remote_datasource.dart';
import 'package:ecowave/features/payment/model/datasource/expedition_remote_datasource.dart';
import 'package:ecowave/features/payment/model/repository/address_repository.dart';
import 'package:ecowave/features/payment/model/repository/expedition_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => AddressBloc(locator()));
  locator.registerFactory(() => ExpeditionBloc(locator()));

  // repository
  locator.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(locator()));
  locator.registerLazySingleton<ExpeditionRepository>(
      () => ExpeditionRepositoryImpl(locator()));

  // remote datasource
  locator.registerLazySingleton<AddressRemoteDatasource>(
      () => AddressRemoteDatasourceImpl());
  locator.registerLazySingleton<ExpeditionRemoteDatasource>(
      () => ExpeditionRemoteDatasourceImpl());

  // local datasource
}
