import 'package:ecowave/core/utils/injector.dart' as di;
import 'package:ecowave/features/ecommerce/bloc/product_home/product_bloc.dart';
import 'package:ecowave/features/home/bloc/page_bloc.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_method/payment_method_bloc.dart';
import 'package:ecowave/features/payment/bloc/shipping_address/shipping_address_bloc.dart';
import 'package:ecowave/features/payment/bloc/voucher/voucher_bloc.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers {
  static final List<BlocProvider> init = [
    BlocProvider<PageBloc>(
        create: (context) => di.locator<PageBloc>()),
    BlocProvider<ShippingAddressBloc>(
        create: (context) => di.locator<ShippingAddressBloc>()),
    BlocProvider<PaymentMethodBloc>(
        create: (context) => di.locator<PaymentMethodBloc>()),
    BlocProvider<ExpeditionBloc>(
        create: (context) => di.locator<ExpeditionBloc>()),
    BlocProvider<HistoryTransactionBloc>(
        create: (context) => di.locator<HistoryTransactionBloc>()),
    BlocProvider<VoucherBloc>(create: (context) => di.locator<VoucherBloc>()),
    BlocProvider<ProductBloc>(create: (context) => di.locator<ProductBloc>()),
  ];
}
