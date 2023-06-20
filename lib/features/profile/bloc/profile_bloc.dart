import 'package:ecowave/features/profile/model/models/profile_model.dart';
import 'package:ecowave/features/profile/model/services/profile_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';
part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService service;
  ProfileBloc(this.service) : super(ProfileState.initial()) {
    on<GetDataUser>((event, emit) async {
      final userData = await ProfileService().fetchUserProfile();
      UserProfileModel dataUser = UserProfileModel.fromJson(userData);
      print(dataUser);
      emit(ProfileState(user: dataUser));
    });

     on<UpdateDataUser>((event, emit) async {
      try {
        // Melakukan update data pengguna
        await service.updateUserProfile(
          event.fullName,
          event.email,
          event.username,
          event.phoneNumber,
          event.profilePhotoUrl,
        );

        // Memperbarui state dengan data pengguna yang telah diperbarui
        final userData = await service.fetchUserProfile();
        print(userData);
      } catch (error) {

      }
    });
  }
}
