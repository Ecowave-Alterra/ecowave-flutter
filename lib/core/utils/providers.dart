import 'package:ecowave/core/utils/injector.dart' as di;
import 'package:ecowave/features/cart/bloc/cart/cart_bloc.dart';
import 'package:ecowave/features/cart/bloc/counterItem/counter_item_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_deadline_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers {
  static final List<BlocProvider> init = [
    BlocProvider<PaymentDeadlineBloc>(
        create: (context) => di.locator<PaymentDeadlineBloc>()),
    BlocProvider<CartBloc>(
        create: (context) => di.locator<CartBloc>()..add(CartInsert())),
    BlocProvider<CounterItemBloc>(
        create: (context) => di.locator<CounterItemBloc>()),
  ];
}
