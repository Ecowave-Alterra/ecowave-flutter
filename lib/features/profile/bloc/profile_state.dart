part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final DataStateStatus status;
  final UserProfileModel user;

  const ProfileState({
    this.status = DataStateStatus.initial,
    required this.user,
  });

  factory ProfileState.initial() {
    return ProfileState(
      user: UserProfileModel(
        username: '',
        email: '',
        name: '',
        phone: '',
        id: 0,
        point: 0,
        profilePhotoUrl: '',
      ),
    );
  }

  @override
  List<Object?> get props => [user];

  @override
  bool get stringify => true;
}
