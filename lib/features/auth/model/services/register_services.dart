import 'dart:async';
import 'package:ecowave/features/auth/model/models/register_model.dart';

class RegisterService {
  List<RegisterModel> registeredUsers = [
    RegisterModel(
      name: 'John Doe',
      username: 'johndoe',
      email: 'johndoe@example.com',
      phoneNumber: '1234567890',
      password: 'password123',
    ),
    RegisterModel(
      name: 'Jane Smith',
      username: 'janesmith',
      email: 'janesmith@example.com',
      phoneNumber: '0987654321',
      password: 'password456',
    ),
  ];

  Future<bool> register(RegisterModel registerData) async {
    // Simulasikan proses registrasi ke server
    await Future.delayed(Duration(seconds: 2));

    bool isDuplicateEmail = checkDuplicateEmail(registerData.email);
    bool isDuplicateUsername = checkDuplicateUsername(registerData.username);

    if (isDuplicateEmail || isDuplicateUsername) {
      return false;
    }
    bool isSuccess = true;

    if (isSuccess) {
      registeredUsers.add(registerData);
    }

    return isSuccess;
  }

  bool checkDuplicateEmail(String email) {
    return registeredUsers.any((user) => user.email == email);
  }

  bool checkDuplicateUsername(String username) {
    return registeredUsers.any((user) => user.username == username);
  }
}

