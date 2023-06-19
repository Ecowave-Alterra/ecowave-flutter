import 'package:flutter_bloc/flutter_bloc.dart';

class TabbarBloc extends Bloc<int, int> {
  TabbarBloc() : super(0) {
    on<int>((event, emit) {
      emit(event);
    });
  }
}
