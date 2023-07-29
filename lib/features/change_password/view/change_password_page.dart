import 'package:ecowave/features/auth/view/login_page.dart';
import 'package:ecowave/features/change_password/bloc/change_password/change_password_bloc.dart';
import 'package:ecowave/features/change_password/model/models/change_password_model.dart';
import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordPage extends StatefulWidget {
  final String email;
  const ChangePasswordPage({Key? key, required this.email}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordNewController = TextEditingController();
  final TextEditingController _passwordNewConfirController =
      TextEditingController();

  bool _isLoginButtonDisabled = true;

  void _checkLoginButtonStatus() {
    final passwordNew = _passwordNewController.text;
    final passwordNewConfir = _passwordNewConfirController.text;

    setState(() {
      _isLoginButtonDisabled = passwordNew.isEmpty || passwordNewConfir.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordNewController.addListener(_checkLoginButtonStatus);
    _passwordNewConfirController.addListener(_checkLoginButtonStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ubah Password'),
        ),
        body: BlocListener<ChangePasswordBloc, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordFailed) {
              "Gagal mengubah password".failedBar(context);
            } else if (state is ChangePasswordSuccess) {
              context.pushAndRemoveUntil(const LoginPage(), (route) => false);
              "Berhasil mengubah password".succeedBar(context);
            }
          },
          child: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
            builder: (context, state) {
              if (state is ChangePasswordLoading) {
                return const EcoLoading();
              } else {
                return SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Form(
                      key: _formKey,
                      child: Column(children: [
                        30.0.height,
                        EcoFormInputPassword(
                          label: 'Password Baru',
                          hint: 'Masukkan password Baru Anda',
                          controller: _passwordNewController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password Lama tidak boleh kosong';
                            } else if (value.length < 6) {
                              return 'Password harus memiliki setidaknya 6 karakter';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _checkLoginButtonStatus();
                          },
                        ),
                        20.0.height,
                        EcoFormInputPassword(
                          label: 'Konfirmasi Password Baru',
                          hint: 'Masukkan konfirmasi password baru',
                          controller: _passwordNewConfirController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password tidak boleh kosong';
                            } else if (value.length < 6) {
                              return 'Password harus memiliki setidaknya 6 karakter';
                            } else if (value != _passwordNewController.text) {
                              return 'Password tidak sama';
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
                                    context
                                        .read<ChangePasswordBloc>()
                                        .add(DoChangePasswordEvent(
                                          request: ChangePasswordModel(
                                              email: widget.email,
                                              password:
                                                  _passwordNewController.text),
                                        ));
                                  }
                                },
                          backgroundColor: _isLoginButtonDisabled
                              ? AppColors.primary300
                              : AppColors.primary500,
                        ),
                      ]),
                    ));
              }
            },
          ),
        ));
  }
}
