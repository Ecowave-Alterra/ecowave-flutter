import 'package:equatable/equatable.dart';
import 'package:ecowave/features/profile/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';
part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent,ProfileState>{
  ProfileBloc():super(ProfileState.initial()){
    on<getDataUser>((event, emit) {
      emit(ProfileState(user: event.userData));
      print(event.userData);
    });
  }
}