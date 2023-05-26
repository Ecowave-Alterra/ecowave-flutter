import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _noTelpController = TextEditingController();

  bool _isLoginButtonDisabled = true;

void _checkLoginButtonStatus() {
    final email = _emailController.text;
    final password = _passwordController.text;
    final username = _usernameController.text;
    final noTelp = _noTelpController.text;
    final name = _nameController.text;

    setState(() {
      _isLoginButtonDisabled = email.isEmpty || password.isEmpty || username.isEmpty || noTelp.isEmpty|| name.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkLoginButtonStatus);
    _passwordController.addListener(_checkLoginButtonStatus);
    _usernameController.addListener(_checkLoginButtonStatus);
    _nameController.addListener(_checkLoginButtonStatus);
    _noTelpController.addListener(_checkLoginButtonStatus);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('Daftar Sekarang'),
         centerTitle: true,
      ),  
      body: SingleChildScrollView(
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
                 icon:const ImageIcon(
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
                onChanged: (value) {
                  _checkLoginButtonStatus();
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
                 icon:const ImageIcon(
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
                 icon:const ImageIcon(
                  AppIcons.username,
                  color: AppColors.grey500,
                ),
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
                  _checkLoginButtonStatus();
                },
              ), 
              20.0.height,
                // Other form inputs like email and password      
                EcoFormButton(
                label: 'Register',
                onPressed: _isLoginButtonDisabled ? () {} : () {
                  if (_formKey.currentState!.validate()) {

                    }
                },
                backgroundColor: _isLoginButtonDisabled
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
              const Text("Dengan daftar ke EcoWave. Anda setuju dngan",style: TextStyle(color: AppColors.grey500),),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Persyaratan dan Ketentuan & Kebijakan Privasi",style: TextStyle(color: AppColors.primary500)),
                  Text(" kami",style: TextStyle(color: AppColors.grey500))
                ],
              )
             ]
           ),
         )
      )
    );
  }
}