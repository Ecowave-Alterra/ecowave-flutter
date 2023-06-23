import 'package:ecowave/features/auth/bloc/register/register_bloc.dart';
import 'package:ecowave/features/auth/view/login_page.dart';
import 'package:ecowave/features/auth/view/register_complate_page.dart';
import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _noTelpController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Sekarang'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => RegisterBloc(
            emailController: _emailController,
            passwordController: _passwordController,
            usernameController: _usernameController,
            noTelpController: _noTelpController,
            nameController: _nameController),
        child: BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state)async {
          if (state is RegisterError) {
            "Email Sudah Digunakan."
                  .failedBar(context);
          }
          if (state is RegisterSuccess) {
            
           await context.push(const LoginPage());
           if(context.mounted){
            dispose();
           }
          }
        }, builder: (context, state) {
          if (state is RegisterLoading) {
            return const EcoLoading();
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset(
                    AppImages.logo,
                    width: 200,
                    height: 200,
                  ),
                  20.0.height,
                  EcoFormInput(
                      label: 'Nama',
                      controller: _nameController,
                      hint: 'Masukan Nama Anda',
                      icon: const ImageIcon(
                        AppIcons.name,
                        color: AppColors.grey500,
                      ),
                      onChanged: (value) {
                        context
                            .read<RegisterBloc>()
                            .add(const RegisterInputChange());
                      }),
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
                      context
                          .read<RegisterBloc>()
                          .add(const RegisterInputChange());
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
                      context
                          .read<RegisterBloc>()
                          .add(const RegisterInputChange());
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username tidak boleh kosong';
                      }
                      return null;
                    },
                  ),

                  20.0.height,
                  EcoFormInput(
                    label: 'No. Telepon',
                    controller: _noTelpController,
                    keyboardType: TextInputType.number,
                    hint: 'Masukan Nomor telefon Anda',
                    icon: const ImageIcon(
                      AppIcons.numberPhone,
                      color: AppColors.grey500,
                    ),
                    onChanged: (value) {
                      context
                          .read<RegisterBloc>()
                          .add(const RegisterInputChange());
                    },
                  ),
                  20.0.height,
                  EcoFormInputPassword(
                    label: 'Password',
                    hint: 'Masukkan password',
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      } else if (value.length < 8) {
                        return 'Password harus memiliki setidaknya 8 karakter';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      context
                          .read<RegisterBloc>()
                          .add(const RegisterInputChange());
                    },
                  ),
                  20.0.height,
                  // Other form inputs like email and password
                  EcoFormButton(
                    label: 'Register',
                    onPressed: state.isRegisterButtonDisabled
                        ? () {}
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<RegisterBloc>()
                                  .add(const RegisterButtonPressed());
                            }
                          },
                    backgroundColor: state.isRegisterButtonDisabled
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
                      context.push(const RegisterComplatePage());
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
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Dengan daftar ke EcoWave. Anda setuju dengan ",
                          style: TextStyle(color: AppColors.grey500),
                        ),
                        TextSpan(
                          text: "Persyaratan dan Ketentuan & Kebijakan Privasi",
                          style: TextStyle(color: AppColors.primary500),
                        ),
                        TextSpan(
                          text: " kami",
                          style: TextStyle(color: AppColors.grey500),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
