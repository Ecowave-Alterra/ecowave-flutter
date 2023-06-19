// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetDataUser extends ProfileEvent {
  final UserModel userData;

  GetDataUser(
    this.userData,
  );
  @override
  List<Object?> get props => [userData];
}
