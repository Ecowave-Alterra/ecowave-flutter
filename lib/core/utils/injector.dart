import 'package:ecowave/features/address/bloc/address/address_bloc.dart';
import 'package:ecowave/features/address/model/services/address_service.dart';
import 'package:ecowave/features/cart/bloc/cart/cart_bloc.dart';
import 'package:ecowave/features/information/bloc/informatio/information_bloc.dart';
import 'package:ecowave/features/information/model/services/information_service.dart';
import 'package:ecowave/features/ecommerce/bloc/product_home/product_bloc.dart';
import 'package:ecowave/features/ecommerce/model/services/product_service.dart';
import 'package:ecowave/features/home/bloc/home/home_bloc.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/payment/bloc/get_point/get_point_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
import 'package:ecowave/features/payment/bloc/voucher/voucher_bloc.dart';
import 'package:ecowave/features/payment/model/services/expedition_service.dart';
import 'package:ecowave/features/payment/model/services/get_point_service.dart';
import 'package:ecowave/features/payment/model/services/transaction_service.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/model/services/history_transaction_service.dart';
import 'package:ecowave/features/payment/model/services/voucher_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => AddressBloc(locator()));
  locator.registerFactory(() => HomeBloc());
  locator.registerFactory(() => CartBloc());
  locator.registerFactory(() => GetPointBloc(locator()));
  locator.registerFactory(() => ExpeditionBloc(locator()));
  locator.registerFactory(() => PaymentDetailBloc(locator()));
  locator.registerFactory(() => HistoryTransactionBloc(locator()));
  locator.registerFactory(() => VoucherBloc(locator()));
  locator.registerFactory(() => InformationBloc(locator()));
  locator.registerFactory(() => ProductBloc(locator()));

  // service
  locator.registerLazySingleton<AddressService>(() => AddressService());
  locator.registerLazySingleton<GetPointService>(() => GetPointService());
  locator.registerLazySingleton<ExpeditionService>(() => ExpeditionService());
  locator.registerLazySingleton<TransactionService>(() => TransactionService());
  locator.registerLazySingleton<HistoryTransactionService>(
      () => HistoryTransactionService());
  locator.registerLazySingleton<VoucherService>(() => VoucherService());
  locator.registerLazySingleton<InformationService>(() => InformationService());
  locator.registerLazySingleton<ProductService>(() => ProductService());
}
