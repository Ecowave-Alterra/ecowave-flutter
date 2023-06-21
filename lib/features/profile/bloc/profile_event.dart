// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class GetDataUser extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class DeleteDataUser extends ProfileEvent {
  @override
  List<Object?> get props => [];
}
class UpdateDataUser extends ProfileEvent {
  final String fullName;
  final String email;
  final String username;
  final String phoneNumber;
  final String profilePhotoUrl;

  UpdateDataUser({
    required this.fullName,
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.profilePhotoUrl,
  });
}

class UpdateDataError extends ProfileEvent {
  final String errorMessage;

  UpdateDataError(this.errorMessage);
}
