import 'package:flutter_bloc/flutter_bloc.dart';

class PageBloc extends Bloc<int, int> {
  PageBloc() : super(0) {
    on<int>((event, emit) => emit(event));
  }
}