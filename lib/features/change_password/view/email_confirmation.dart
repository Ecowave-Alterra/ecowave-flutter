import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';

class EmailConfirmatioPage extends StatefulWidget {
  const EmailConfirmatioPage({Key? key}) : super(key: key);

  @override
  State<EmailConfirmatioPage> createState() => _EmailConfirmatioPageState();
}

class _EmailConfirmatioPageState extends State<EmailConfirmatioPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      appBar: AppBar(title: const Text("Lupa Password")),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AppIcons.emailConfirmatio,
              ),
              const SizedBox(height: AppSizes.primary),
              const Text(
                "Tautan Reset Password Terkirim!",
                style: TextStyle(
                  fontSize: AppSizes.secondary,
                  color: AppColors.black,
                  fontWeight: AppFontWeight.bold
                ),
              ),
              const Text("Cek email kamu untuk melihat tautan reset password.",
                  style: TextStyle(
                  fontSize: AppSizes.primary,
                  color: AppColors.grey500,
                ),
                textAlign: TextAlign.center,
              ),
              30.0.height
            ],
          ),
      ),
    );
  }
}