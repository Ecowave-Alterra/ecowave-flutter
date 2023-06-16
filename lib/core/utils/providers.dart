import 'package:ecowave/core/utils/injector.dart' as di;
import 'package:ecowave/features/address/bloc/address/address_bloc.dart';
import 'package:ecowave/features/cart/bloc/cart/cart_bloc.dart';

import 'package:ecowave/features/information/bloc/informatio/information_bloc.dart';
import 'package:ecowave/features/ecommerce/bloc/product_home/product_bloc.dart';
import 'package:ecowave/features/home/bloc/home/home_bloc.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
import 'package:ecowave/features/payment/bloc/voucher/voucher_bloc.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers {
  static final List<BlocProvider> init = [
    BlocProvider<AddressBloc>(create: (context) => di.locator<AddressBloc>()),
    BlocProvider<HomeBloc>(create: (context) => di.locator<HomeBloc>()),
    BlocProvider<CartBloc>(create: (context) => di.locator<CartBloc>()),
    BlocProvider<ExpeditionBloc>(
        create: (context) => di.locator<ExpeditionBloc>()),
    BlocProvider<PaymentDetailBloc>(
        create: (context) => di.locator<PaymentDetailBloc>()),
    BlocProvider<HistoryTransactionBloc>(
        create: (context) => di.locator<HistoryTransactionBloc>()),
    BlocProvider<VoucherBloc>(create: (context) => di.locator<VoucherBloc>()),
    BlocProvider<InformationBloc>(
        create: (context) => di.locator<InformationBloc>()),
    BlocProvider<ProductBloc>(create: (context) => di.locator<ProductBloc>()),
  ];
}
