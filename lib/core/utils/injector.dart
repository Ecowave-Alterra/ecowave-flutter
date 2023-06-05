import 'package:ecowave/features/cart/bloc/cart/cart_bloc.dart';
import 'package:ecowave/features/cart/bloc/counterItem/counter_item_bloc.dart';
import 'package:ecowave/features/cart/model/service/cart_database.dart';
import 'package:ecowave/features/payment/bloc/payment_deadline_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => PaymentDeadlineBloc());
  locator.registerFactory(() => CartBloc(locator()));
  locator.registerFactory(() => CounterItemBloc(locator()));

  // repository

  // remote service

  // local service
  locator.registerLazySingleton<DatabaseInstance>(() => DatabaseInstance());
}
