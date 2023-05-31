import 'package:ecowave/features/payment/bloc/address/address_bloc.dart';
import 'package:ecowave/features/payment/bloc/voucher/voucher_bloc.dart';
import 'package:ecowave/features/payment/model/datasource/address_remote_datasource.dart';
import 'package:ecowave/features/payment/model/datasource/voucher_remote_datasource.dart';
import 'package:ecowave/features/payment/model/repository/address_repository.dart';
import 'package:ecowave/features/payment/model/repository/voucher_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => AddressBloc(locator()));
  locator.registerFactory(() => VoucherBloc(locator()));

  // repository
  locator.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(locator()));
  locator.registerLazySingleton<VoucherRepository>(
      () => VoucherRepositoryImpl(locator()));

  // remote datasource
  locator.registerLazySingleton<AddressRemoteDatasource>(
      () => AddressRemoteDatasourceImpl());
  locator.registerLazySingleton<VoucherRemoteDatasource>(
      () => VoucherRemoteDatasourceImpl());

  // local datasource
}
