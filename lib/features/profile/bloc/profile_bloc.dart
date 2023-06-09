import 'package:ecowave/core.dart';
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
      try {
        final Map<String, dynamic> userData = await service.fetchUserProfile();
        UserProfileModel dataUser = UserProfileModel.fromJson(userData);
        emit(ProfileState(
          status: DataStateStatus.success,
          user: dataUser,
        ));
      } catch (e) {
        emit(ProfileState(
          status: DataStateStatus.error,
          user: UserProfileModel(
            username: '',
            email: '',
            name: '',
            phone: '',
            id: 0,
            point: 0,
            profilePhotoUrl: '',
          ),
        ));
      }
    });

    on<GetDataUserFromLogin>((event, emit) {
      emit(ProfileState(user: event.user));
    });

    on<UpdateDataUser>((event, emit) async {
      try {
        await service.updateUserProfile(
          event.fullName,
          event.email,
          event.username,
          event.phoneNumber,
          event.profilePhotoUrl,
        );
        await service.fetchUserProfile();
      } catch (error) {
        rethrow;
      }
    });

    on<DeleteDataUser>((event, emit) {
      emit(ProfileState.initial());
    });
  }
}
