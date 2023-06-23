// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final UserProfileModel user;

  const ProfileState({required this.user});

  factory ProfileState.initial() {
    return  ProfileState(user:UserProfileModel(username: '', email: '',name: '',phone: '',id: 0,point: 0,profilePhotoUrl: '') );
  }

  @override
  List<Object?> get props => [user];

  @override
  bool get stringify => true;


}
