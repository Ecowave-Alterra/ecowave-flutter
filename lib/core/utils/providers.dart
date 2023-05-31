import 'package:ecowave/core/utils/injector.dart' as di;
import 'package:ecowave/features/payment/bloc/address/address_bloc.dart';
import 'package:ecowave/features/payment/bloc/voucher/voucher_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers {
  static final List<BlocProvider> init = [
    BlocProvider<AddressBloc>(create: (context) => di.locator<AddressBloc>()),
    BlocProvider<VoucherBloc>(create: (context) => di.locator<VoucherBloc>()),
  ];
}
