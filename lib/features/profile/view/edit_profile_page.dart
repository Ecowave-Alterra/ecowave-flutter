import 'dart:io';

import 'package:ecowave/features/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ecowave/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late final ProfileState userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = context.read<ProfileBloc>().state;
    _nameController.text = userBloc.user.name;
    _emailController.text = userBloc.user.email;
    _usernameController.text = userBloc.user.username;
    _noTelpController.text = userBloc.user.phone;
  }

  bool get isChackButton {
    final email = _emailController.text;
    final username = _usernameController.text;
    final noTelp = _noTelpController.text;
    final name = _nameController.text;
    final image = _image;

    return (email != userBloc.user.email ||
        username != userBloc.user.username ||
        noTelp != userBloc.user.phone ||
        name != userBloc.user.name ||
        image != null);
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isExist = ValueNotifier<bool>(false);
    Future<void> pickImage() async {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);

      if (result != null) {
        setState(() {
          _image = File(result.files.single.path!);
        });
        if (context.mounted) {
          "Berhasil! Foto profil berhasil diubah".succeedBar(context);
          isExist.value = isChackButton;
        }
      } else {
        if (context.mounted) {
          "Ups! Foto profil gagal diunggah. Coba lagi ya".failedBar(context);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Saya")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.primary),
          child: Center(
            child: Form(
              key: _formKey,
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
                    onPressed: pickImage,
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
                    onChanged: (value) {
                      isExist.value = isChackButton;
                    },
                  ),
                  20.0.height,
                  EcoFormInput(
                    label: 'Email',
                    hint: 'Masukkan alamat email',
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value == null) {
                        return 'Email tidak boleh kosong';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Alamat email tidak valid';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      isExist.value = isChackButton;
                    },
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
                    onChanged: (value) {
                      isExist.value = isChackButton;
                    },
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
                    onChanged: (value) {
                      isExist.value = isChackButton;
                    },
                  ),
                  140.0.height,
                  ValueListenableBuilder(
                    valueListenable: isExist,
                    builder: (context, value, child) => EcoFormButton(
                      label: 'Simpan',
                      onPressed: value
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                "Yey! Profil kamu berhasil diubah"
                                    .succeedBar(context);
                              }
                            }
                          : null,
                      backgroundColor:
                          value ? AppColors.primary500 : AppColors.primary300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
