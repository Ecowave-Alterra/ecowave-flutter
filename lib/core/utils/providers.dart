import 'package:ecowave/core/utils/injector.dart' as di;
import 'package:ecowave/features/payment/bloc/payment_deadline_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers {
  static final List<BlocProvider> init = [
    BlocProvider<PaymentDeadlineBloc>(
        create: (context) => di.locator<PaymentDeadlineBloc>()),
  ];
}
