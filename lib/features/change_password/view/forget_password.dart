import 'package:ecowave/features/change_password/view/email_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  bool _isLoginButtonDisabled = true;

  void _checkLoginButtonStatus() {
    final email = _emailController.text;

    setState(() {
      _isLoginButtonDisabled = email.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkLoginButtonStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      appBar: AppBar(title: const Text("Lupa Password")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [ 
                const Text(
                  "Buat Password Baru", style: TextStyle( fontSize: AppSizes.primary), 
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
                  onChanged: (value) {
                    _checkLoginButtonStatus();
                  },
                  icon: const ImageIcon(
                    AppIcons.email,
                    color: AppColors.grey500,
                  ),
                ),
                 20.0.height,
                 EcoFormButton(
                  label: 'Lanjutkan',
                  onPressed: _isLoginButtonDisabled ? () {} : () {
                    if (_formKey.currentState!.validate()) {
                       Navigator.push(
                        context,  
                        MaterialPageRoute(builder: (context) => const EmailConfirmatioPage()),  
                      );
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