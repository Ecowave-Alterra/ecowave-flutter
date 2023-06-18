import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initial()) {
    on<HomeEvent>((event, emit) async {
      if (event is UpdateSharedPreferences) {
        try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String userId = prefs.getString('token')??'';
          emit(state.copyWith(token: userId));
        } catch (error) {
          await Future.delayed(const Duration(seconds: 2));
        }
      }
    });

    on<OnBottomNavTap>((event, emit) {
      emit(state.copyWith(index: event.index));
    });

     on<LogOut>((event, emit) {
      emit(state.copyWith(token: ''));
    });

    
  }
  

  void changeSharedPreferences() {
    add(UpdateSharedPreferences());
  }
}
