import 'dart:convert';

ChangePasswordModel changePasswordModelFromJson(String str) =>
    ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) =>
    json.encode(data.toJson());

class ChangePasswordModel {
  final String email;
  final String password;

  ChangePasswordModel({
    required this.email,
    required this.password,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) =>
      ChangePasswordModel(
        email: json["Email"],
        password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "Password": password,
      };
}
