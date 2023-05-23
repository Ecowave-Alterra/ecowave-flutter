import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordNewController = TextEditingController();

  bool _isLoginButtonDisabled = true;

  void _checkLoginButtonStatus() {
    final passwordNew = _passwordNewController.text;

    setState(() {
      _isLoginButtonDisabled = passwordNew.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordNewController.addListener(_checkLoginButtonStatus);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Password'),
      ),  
      body: SingleChildScrollView(
         padding: const EdgeInsets.all(10),
         child: Form(
          key: _formKey,
           child:Column( 
               children: [
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
                  label: 'Password Baru',
                  hint: 'Masukkan password Baru Anda',
                  controller: _passwordNewController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password tidak boleh kosong';
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
                EcoFormButton(
                  label: 'Ganti Password',
                  onPressed: _isLoginButtonDisabled ? () {} : () {
                    if (_formKey.currentState!.validate()) {

                    }
                  },
                  backgroundColor: _isLoginButtonDisabled
                      ? AppColors.primary300
                      : AppColors.primary500,
                ),
               ]
             ),
         ) 
      )  
    );
  }
}