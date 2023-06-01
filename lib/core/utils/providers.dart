import 'package:ecowave/core/utils/injector.dart' as di;
import 'package:ecowave/features/payment/bloc/shipping_address/shipping_address_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers {
  static final List<BlocProvider> init = [
    BlocProvider<ShippingAddressBloc>(
        create: (context) => di.locator<ShippingAddressBloc>()),
  ];
}
