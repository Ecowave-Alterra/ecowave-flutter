import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ecowave/core.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _image;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();

  bool _isLoginButtonDisabled = true;

  void _checkLoginButtonStatus() {
    final email = _emailController.text;
    final username = _usernameController.text;
    final noTelp = _noTelpController.text;
    final name = _nameController.text;

    setState(() {
      _isLoginButtonDisabled =
          email.isEmpty || username.isEmpty || noTelp.isEmpty || name.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkLoginButtonStatus);
    _usernameController.addListener(_checkLoginButtonStatus);
    _nameController.addListener(_checkLoginButtonStatus);
    _noTelpController.addListener(_checkLoginButtonStatus);
  }

  Future<void> _pickImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null) {
      setState(() {
        _image = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saya")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundColor: AppColors.primary50,
                child: ClipOval(
                  child: _image != null
                      ? Image.file(
                          _image!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        )
                      : const Image(
                          image: AppIcons.profile,
                          width: 40,
                          height: 40,
                        ),
                ),
              ),
              10.0.height,
              TextButton(
                onPressed: _pickImage,
                child: const Text(
                  'Ubah Foto Profile',
                  style: TextStyle(
                      color: AppColors.primary500,
                      fontWeight: AppFontWeight.bold,
                      fontSize: 16),
                ),
              ),
              EcoFormInput(
                label: 'Nama',
                controller: _nameController,
                hint: 'Masukan Nama Anda',
                icon: const ImageIcon(
                  AppIcons.name,
                  color: AppColors.grey500,
                ),
              ),
              20.0.height,
              EcoFormInput(
                label: 'Email',
                hint: 'Masukkan alamat email',
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Alamat email tidak valid';
                  }
                  return null;
                },
                onChanged: (value) {},
                icon: const ImageIcon(
                  AppIcons.email,
                  color: AppColors.grey500,
                ),
              ),
              20.0.height,
              EcoFormInput(
                label: 'Username',
                controller: _usernameController,
                hint: 'Masukan Nama Anda',
                icon: const ImageIcon(
                  AppIcons.username,
                  color: AppColors.grey500,
                ),
              ),
              20.0.height,
              EcoFormInput(
                label: 'No. Telepon',
                controller: _noTelpController,
                keyboardType: TextInputType.number,
                hint: 'Masukan Nama Anda',
                icon: const ImageIcon(
                  AppIcons.username,
                  color: AppColors.grey500,
                ),
              ),
              140.0.height,
              EcoFormButton(
                label: 'Simpan',
                onPressed: _isLoginButtonDisabled
                    ? () {}
                    : () {
                        if (_formKey.currentState!.validate()) {}
                      },
                backgroundColor: _isLoginButtonDisabled
                    ? AppColors.primary300
                    : AppColors.primary500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
