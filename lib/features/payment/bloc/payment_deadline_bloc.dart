import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentDeadlineBloc extends Bloc<DateTime, Duration> {
  PaymentDeadlineBloc() : super(Duration.zero) {
    on<DateTime>((event, emit) {
      // final DateTime targetTime = event;

      // Duration remainingTime = targetTime.difference(DateTime.now());
      // if (remainingTime.isNegative) {
      //   remainingTime = Duration.zero;
      // }

      // Timer.periodic(const Duration(seconds: 1), (timer) {
      //   remainingTime = targetTime.difference(DateTime.now());
      //   if (remainingTime.isNegative) {
      //     remainingTime = Duration.zero;
      //     timer.cancel();
      //   }
      //   emit(remainingTime);
      // });
    });
  }
}
