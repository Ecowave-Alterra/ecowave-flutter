import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';

class RegisterComplatePage extends StatefulWidget {
  const RegisterComplatePage({Key? key}) : super(key: key);

  @override
  State<RegisterComplatePage> createState() => _RegisterComplatePageState();
}

class _RegisterComplatePageState extends State<RegisterComplatePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();

  bool _isLoginButtonDisabled = true;

  void _checkLoginButtonStatus() {
    final email = _nameController.text;
    final username = _usernameController.text;
    final noTelp = _noTelpController.text;

    setState(() {
      _isLoginButtonDisabled =
          email.isEmpty || username.isEmpty || noTelp.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkLoginButtonStatus);
    _usernameController.addListener(_checkLoginButtonStatus);
    _noTelpController.addListener(_checkLoginButtonStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lengkapi Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.primary),
        child: Center(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
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
                      hint: 'Masukan No. Telepon Anda',
                      icon: const ImageIcon(
                        AppIcons.username,
                        color: AppColors.grey500,
                      ),
                    ),
                    20.0.height,
                    EcoFormButton(
                      label: 'Register',
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
                ))),
      ),
    );
  }
}
