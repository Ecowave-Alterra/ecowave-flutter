import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecowave/features/change_password/bloc/otp/otp_bloc.dart';
import 'package:ecowave/features/change_password/model/services/change_password_service.dart';
import 'package:ecowave/features/change_password/view/email_confirmation.dart';
import 'package:ecowave/core.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

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
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lupa Password")),
      body: BlocProvider(
        create: (context) => OtpBloc(ChangePasswordService()),
        child: BlocListener<OtpBloc, OtpState>(
          listener: (context, state) {
            if (state is OtpError) {
              "Gagal mengirim OTP, cek kembali email Anda".failedBar(context);
            } else if (state is OtpSuccess) {
              context.pushAndRemoveUntil(
                  EmailConfirmatioPage(
                    email: _emailController.text,
                  ),
                  (route) => false);
            }
          },
          child: BlocBuilder<OtpBloc, OtpState>(
            builder: (context, state) {
              if (state is OtpLoading) {
                return const EcoLoading();
              } else if (state is OtpSuccess) {
                return const SizedBox.shrink();
              } else {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Buat Password Baru",
                          style: TextStyle(fontSize: AppSizes.primary),
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
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
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
                          label: 'Kirim OTP',
                          onPressed: _isLoginButtonDisabled
                              ? () {}
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<OtpBloc>(context).add(
                                        SendOtpEvent(_emailController.text));
                                  }
                                },
                          backgroundColor: _isLoginButtonDisabled
                              ? AppColors.primary300
                              : AppColors.primary500,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
