part of 'profile_bloc.dart';

class ProfileState extends Equatable{
  final UserModel? user;

  const ProfileState({required this.user});

  factory ProfileState.initial() {
    return const ProfileState(user: null);
  }

  @override
  List<Object?> get props => [user];

  @override
  bool get stringify => true;

}