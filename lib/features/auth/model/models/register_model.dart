class RegisterModel {
  final String name;
  final String email;
  final String username;
  final String phone;
  final String password;

  RegisterModel({
    required this.name,
    required this.email,
    required this.username,
    required this.phone,
    required this.password,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'],
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'username': username,
      'phone': phone,
      'password': password,
    };
  }
}
