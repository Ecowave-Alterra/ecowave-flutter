import 'package:ecowave/features/auth/view/register_page.dart';
import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../change_password/view/forget_password.dart';
import '../bloc/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(
          emailController: _emailController,
          passwordController: _passwordController
        ),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if (state is LoginError){
            ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal Login'),
          backgroundColor: AppColors.warning500,
        ),
      );
            }else if( state is LoginLoading){
              return const EcoLoading();
            }
            return  SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.logo,
                width: 200,
                height: 200,
              ),
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
                  context.read<LoginBloc>().add(const LoginInputChange());
                },
                icon: const ImageIcon(
                  AppIcons.email,
                  color: AppColors.grey500,
                ),
              ),
              20.0.height,
              EcoFormInputPassword(
                label: 'Password',
                hint: 'Masukkan password',
                controller:_passwordController ,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  } else if (value.length < 8) {
                    return 'Password harus memiliki setidaknya 8 karakter';
                  }
                  return null;
                },
                onChanged: (value) {
                 context.read<LoginBloc>().add(const LoginInputChange());
                },
              ),
              10.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  10.0.width,
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage()),
                      );
                    },
                    child: const Text(
                      "Lupa Password?",
                      style: TextStyle(
                        color: AppColors.primary500,
                        fontWeight: AppFontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              EcoFormButton(
                label:  'Login',
                onPressed: state.isLoginButtonDisabled
                    ? () {}
                    : () {
                        if (_formKey.currentState!.validate()) {
                          context.read<LoginBloc>().add(const LoginButtonPressed());
                         
                        }
                      },
                backgroundColor: state.isLoginButtonDisabled
                    ? AppColors.primary300
                    : AppColors.primary500,
              ),
              36.0.height,
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.0,
                      color: AppColors.grey500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'ATAU',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.0,
                      color: AppColors.grey500,
                    ),
                  ),
                ],
              ),
              36.0.height,
              EcoFormButtonIcon(
                label: 'Lanjutkan menggunakan Google',
                onPressed: () {
                  // aksi yang dilakukan ketika tombol ditekan
                },
                backgroundColor: Colors.white,
                textColor: Colors.black,
                border: Border.all(
                  color: AppColors.grey300,
                ),
                image: const Image(image: AppIcons.google),
                height: 48.0,
                width: MediaQuery.of(context).size.width,
              ),
              36.0.height,
              const Text(
                "Tidak Memiliki Akun?",
                style: TextStyle(color: AppColors.grey500, fontSize: 12),
              ),
              TextButton(
                onPressed: () {
                  context.push(const RegisterPage());
                },
                child: const Text(
                  "Daftar Sekarang",
                  style: TextStyle(color: AppColors.primary500),
                ),
              )
            ],
          ),
        ),
      );
      }))
    );
  }
}
