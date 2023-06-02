import 'package:ecowave/core/utils/injector.dart' as di;
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_method/payment_method_bloc.dart';
import 'package:ecowave/features/payment/bloc/shipping_address/shipping_address_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers {
  static final List<BlocProvider> init = [
    BlocProvider<ShippingAddressBloc>(
        create: (context) => di.locator<ShippingAddressBloc>()),
    BlocProvider<PaymentMethodBloc>(
        create: (context) => di.locator<PaymentMethodBloc>()),
    BlocProvider<ExpeditionBloc>(
        create: (context) => di.locator<ExpeditionBloc>()),
    BlocProvider<PaymentDetailBloc>(
        create: (context) => di.locator<PaymentDetailBloc>()),
  ];
}
