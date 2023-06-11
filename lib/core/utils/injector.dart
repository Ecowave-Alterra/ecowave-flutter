import 'package:ecowave/features/cart/bloc/cart/cart_bloc.dart';
import 'package:ecowave/features/ecommerce/bloc/product_image/product_image_bloc.dart';
import 'package:ecowave/features/ecommerce/model/services/product_image_service.dart';
import 'package:ecowave/features/information/bloc/informatio/information_bloc.dart';
import 'package:ecowave/features/information/model/services/information_service.dart';
import 'package:ecowave/features/ecommerce/bloc/product_home/product_bloc.dart';
import 'package:ecowave/features/ecommerce/model/services/product_service.dart';
import 'package:ecowave/features/home/bloc/home/home_bloc.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
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

import '../../features/ecommerce/bloc/product_category/product_category_bloc.dart';
import '../../features/ecommerce/model/services/product_category_service.dart';

final GetIt locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => HomeBloc());
  locator.registerFactory(() => CartBloc());
  locator.registerFactory(() => ShippingAddressBloc(locator()));
  locator.registerFactory(() => PaymentMethodBloc(locator()));
  locator.registerFactory(() => ExpeditionBloc(locator()));
  locator.registerFactory(() => PaymentDetailBloc());
  locator.registerFactory(() => HistoryTransactionBloc(locator()));
  locator.registerFactory(() => VoucherBloc(locator()));
  locator.registerFactory(() => InformationBloc(locator()));
  locator.registerFactory(() => ProductBloc(locator()));
  locator.registerFactory(() => ProductCategoryBloc(locator()));
  locator.registerFactory(() => ProductImageBloc(locator()));

  // service
  locator.registerLazySingleton<ShippingAddressService>(
      () => ShippingAddressService());
  locator.registerLazySingleton<PaymentMethodService>(
      () => PaymentMethodService());
  locator.registerLazySingleton<ExpeditionService>(() => ExpeditionService());
  locator.registerLazySingleton<HistoryTransactionService>(
      () => HistoryTransactionService());
  locator.registerLazySingleton<VoucherService>(() => VoucherService());
  locator.registerLazySingleton<InformationService>(() => InformationService());
  locator.registerLazySingleton<ProductService>(() => ProductService());
  locator
      .registerLazySingleton<ProductImageService>(() => ProductImageService());
  locator.registerLazySingleton<ProductCategoryService>(
      () => ProductCategoryService());
}
