import 'package:ecowave/core/utils/injector.dart' as di;
import 'package:ecowave/features/payment/bloc/address/address_bloc.dart';
import 'package:ecowave/features/payment/bloc/bloc/payment_method_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers {
  static final List<BlocProvider> init = [
    BlocProvider<AddressBloc>(create: (context) => di.locator<AddressBloc>()),
    BlocProvider<PaymentMethodBloc>(
        create: (context) => di.locator<PaymentMethodBloc>()),
  ];
}
