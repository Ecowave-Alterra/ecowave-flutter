import 'package:ecowave/features/payment/bloc/payment_deadline_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void init() {
  // state management
  locator.registerFactory(() => PaymentDeadlineBloc());

  // repository

  // remote service

  // local service
}
