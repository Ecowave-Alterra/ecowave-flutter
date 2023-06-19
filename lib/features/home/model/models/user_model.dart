class UserModel {
  final int id;
  final String email;
  final String username;
  final String name;
  final int point;
  final String profilePhotoUrl;
  final String address;
  final String token;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.name,
    required this.point,
    required this.profilePhotoUrl,
    required this.address,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['Data']['ID'] as int,
      email: json['Data']['Email'] as String,
      username: json['Data']['Username'] as String,
      name: json['Data']['Name'] as String,
      point: json['Data']['Point'] as int,
      profilePhotoUrl: json['Data']['ProfilePhotoUrl'] as String,
      address: json['Data']['Address'] as String,
      token: json['Data']['Token'] as String,
    );
  }
}
