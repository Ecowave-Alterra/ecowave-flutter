import 'package:ecowave/features/ecommerce/bloc/product_home/product_bloc.dart';
import 'package:ecowave/features/ecommerce/model/services/product_service.dart';
import 'package:ecowave/features/home/bloc/page_bloc.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_method/payment_method_bloc.dart';
import 'package:ecowave/features/payment/bloc/shipping_address/shipping_address_bloc.dart';
import 'package:ecowave/features/payment/bloc/voucher/voucher_bloc.dart';
import 'package:ecowave/features/payment/model/services/expedition_service.dart';
import 'package:ecowave/features/payment/model/services/payment_method_service.dart';
import 'package:ecowave/features/payment/model/services/shipping_address_service.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/model/services/history_transaction_service.dart';
import 'package:ecowave/features/payment/model/services/voucher_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => PageBloc());
  locator.registerFactory(() => ShippingAddressBloc(locator()));
  locator.registerFactory(() => PaymentMethodBloc(locator()));
  locator.registerFactory(() => ExpeditionBloc(locator()));
  locator.registerFactory(() => HistoryTransactionBloc(locator()));
  locator.registerFactory(() => VoucherBloc(locator()));
  locator.registerFactory(() => ProductBloc(locator()));

  // service
  locator.registerLazySingleton<ShippingAddressService>(
      () => ShippingAddressService());
  locator.registerLazySingleton<PaymentMethodService>(
      () => PaymentMethodService());
  locator.registerLazySingleton<ExpeditionService>(() => ExpeditionService());
  locator.registerLazySingleton<HistoryTransactionService>(
      () => HistoryTransactionService());
  locator.registerLazySingleton<VoucherService>(() => VoucherService());
  locator.registerLazySingleton<ProductService>(() => ProductService());
}
