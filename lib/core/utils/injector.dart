import 'package:ecowave/features/address/bloc/address/address_bloc.dart';
import 'package:ecowave/features/address/model/services/address_service.dart';
import 'package:ecowave/features/cart/bloc/cart/cart_bloc.dart';
import 'package:ecowave/features/information/bloc/bookmark/bookmark_bloc.dart';
import 'package:ecowave/features/information/bloc/information/information_bloc.dart';
import 'package:ecowave/features/information/bloc/isBookmark/is_bookmark_bloc.dart';
import 'package:ecowave/features/information/bloc/updatePoint/update_point_bloc.dart';
import 'package:ecowave/features/information/model/services/bookmark_service.dart';
import 'package:ecowave/features/information/model/services/information_service.dart';
import 'package:ecowave/features/ecommerce/bloc/product_home/product_bloc.dart';
import 'package:ecowave/features/ecommerce/model/services/product_service.dart';
import 'package:ecowave/features/home/bloc/home/home_bloc.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_status/payment_status_bloc.dart';
import 'package:ecowave/features/payment/bloc/voucher/voucher_bloc.dart';
import 'package:ecowave/features/payment/model/services/expedition_service.dart';
import 'package:ecowave/features/payment/model/services/transaction_service.dart';
import 'package:ecowave/features/profile/bloc/profile_bloc.dart';
import 'package:ecowave/features/profile/model/services/profile_services.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/bloc/tabbar/tabbar_bloc.dart';
import 'package:ecowave/features/transaction/bloc/tracking_delivery/tracking_delivery_bloc.dart';
import 'package:ecowave/features/transaction/model/services/history_transaction_service.dart';
import 'package:ecowave/features/payment/model/services/voucher_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => AddressBloc(locator()));
  locator.registerFactory(() => HomeBloc());
  locator.registerFactory(() => CartBloc());
  locator.registerFactory(() => ExpeditionBloc(locator()));
  locator.registerFactory(() => PaymentDetailBloc(locator()));
  locator.registerFactory(() => PaymentStatusBloc(locator()));
  locator.registerFactory(() => HistoryTransactionBloc(locator()));
  locator.registerFactory(() => VoucherBloc(locator()));
  locator.registerFactory(() => InformationBloc(locator()));
  locator.registerFactory(() => ProductBloc(locator()));
  locator.registerFactory(() => ProfileBloc(locator()));
  locator.registerFactory(() => TabbarBloc());
  locator.registerFactory(() => TrackingDeliveryBloc(locator()));
  locator.registerFactory(() => BookmarkBloc(locator()));
  locator.registerFactory(() => IsBookmarkBloc(locator()));
  locator.registerFactory(() => UpdatePointBloc(locator()));

  // service
  locator.registerLazySingleton<AddressService>(() => AddressService());
  locator.registerLazySingleton<ExpeditionService>(() => ExpeditionService());
  locator.registerLazySingleton<TransactionService>(() => TransactionService());
  locator.registerLazySingleton<HistoryTransactionService>(
      () => HistoryTransactionService());
  locator.registerLazySingleton<VoucherService>(() => VoucherService());
  locator.registerLazySingleton<InformationService>(() => InformationService());
  locator.registerLazySingleton<ProductService>(() => ProductService());
  locator.registerLazySingleton<ProfileService>(() => ProfileService());
  locator.registerLazySingleton<BookmarkService>(() => BookmarkService());
}
