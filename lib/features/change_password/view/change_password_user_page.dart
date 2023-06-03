import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';

class ChangePasswordUserPage extends StatefulWidget {
  const ChangePasswordUserPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordUserPage> createState() => _ChangePasswordUserPageState();
}

class _ChangePasswordUserPageState extends State<ChangePasswordUserPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordNewController = TextEditingController();
  final TextEditingController _passwordNewConfirController =
      TextEditingController();

  bool _isLoginButtonDisabled = true;

  void _checkLoginButtonStatus() {
    final passwordOld = _passwordController.text;
    final passwordNew = _passwordNewController.text;
    final passwordNewConfir = _passwordNewConfirController.text;

    setState(() {
      _isLoginButtonDisabled = passwordNew.isEmpty ||
          passwordNewConfir.isEmpty ||
          passwordOld.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkLoginButtonStatus);
    _passwordNewController.addListener(_checkLoginButtonStatus);
    _passwordNewConfirController.addListener(_checkLoginButtonStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ubah Password'),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.primary),
            child: Form(
              key: _formKey,
              child: Column(children: [
                20.0.height,
                EcoFormInputPassword(
                  label: 'Password Lama',
                  hint: 'Masukkan password Lama Anda',
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password Lama tidak boleh kosong';
                    } else if (value.length < 8) {
                      return 'Password harus memiliki setidaknya 8 karakter';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _checkLoginButtonStatus();
                  },
                ),
                20.0.height,
                EcoFormInputPassword(
                  label: 'Password Baru',
                  hint: 'Masukkan password Baru Anda',
                  controller: _passwordNewController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password Baru tidak boleh kosong';
                    } else if (value.length < 8) {
                      return 'Password harus memiliki setidaknya 8 karakter';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _checkLoginButtonStatus();
                  },
                ),
                20.0.height,
                EcoFormInputPassword(
                  label: 'Password Baru',
                  hint: 'Masukkan password Baru Anda',
                  controller: _passwordNewConfirController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
                    } else if (value.length < 8) {
                      return 'Password harus memiliki setidaknya 8 karakter';
                    } else if (value != _passwordNewController.text) {
                      return 'Password konfirmasi tidak cocok';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _checkLoginButtonStatus();
                  },
                ),
                20.0.height,
                EcoFormButton(
                  label: 'Ganti Password',
                  onPressed: _isLoginButtonDisabled
                      ? () {}
                      : () {
                          if (_formKey.currentState!.validate()) {
                            "Password berhasil diubah".succeedBar(context);
                          }
                        },
                  backgroundColor: _isLoginButtonDisabled
                      ? AppColors.primary300
                      : AppColors.primary500,
                ),
              ]),
            )));
  }
}
