import 'package:ecowave/features/cart/bloc/cart/cart_bloc.dart';
import 'package:ecowave/features/cart/model/service/cart_storage.dart';
import 'package:ecowave/features/payment/bloc/payment_deadline_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => PaymentDeadlineBloc());
  locator.registerFactory(() => CartBloc());

  // repository

  // remote service

  // local service
}
