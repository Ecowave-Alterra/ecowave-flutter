import 'package:ecowave/core/utils/injector.dart' as di;
import 'package:ecowave/features/address/bloc/address/address_bloc.dart';
import 'package:ecowave/features/cart/bloc/cart/cart_bloc.dart';
import 'package:ecowave/features/change_password/bloc/otp/otp_bloc.dart';
import 'package:ecowave/features/information/bloc/bookmark/bookmark_bloc.dart';
import 'package:ecowave/features/information/bloc/information/information_bloc.dart';
import 'package:ecowave/features/ecommerce/bloc/product_home/product_bloc.dart';
import 'package:ecowave/features/home/bloc/home/home_bloc.dart';
import 'package:ecowave/features/information/bloc/isBookmark/is_bookmark_bloc.dart';
import 'package:ecowave/features/information/bloc/updatePoint/update_point_bloc.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_status/payment_status_bloc.dart';
import 'package:ecowave/features/payment/bloc/voucher/voucher_bloc.dart';
import 'package:ecowave/features/profile/bloc/profile_bloc.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/bloc/tabbar/tabbar_bloc.dart';
import 'package:ecowave/features/transaction/bloc/tracking_delivery/tracking_delivery_bloc.dart';
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
    BlocProvider<PaymentStatusBloc>(
        create: (context) => di.locator<PaymentStatusBloc>()),
    BlocProvider<HistoryTransactionBloc>(
        create: (context) => di.locator<HistoryTransactionBloc>()),
    BlocProvider<VoucherBloc>(create: (context) => di.locator<VoucherBloc>()),
    BlocProvider<InformationBloc>(
        create: (context) => di.locator<InformationBloc>()),
    BlocProvider<ProductBloc>(create: (context) => di.locator<ProductBloc>()),
    BlocProvider<ProfileBloc>(create: (context) => di.locator<ProfileBloc>()),
    BlocProvider<TabbarBloc>(create: (context) => di.locator<TabbarBloc>()),
    BlocProvider<TrackingDeliveryBloc>(
        create: (context) => di.locator<TrackingDeliveryBloc>()),
    BlocProvider<BookmarkBloc>(create: (context) => di.locator<BookmarkBloc>()),
    BlocProvider<IsBookmarkBloc>(
        create: (context) => di.locator<IsBookmarkBloc>()),
    BlocProvider<UpdatePointBloc>(
        create: (context) => di.locator<UpdatePointBloc>()),
    BlocProvider<OtpBloc>(create: (context) => di.locator<OtpBloc>()),
  ];
}
