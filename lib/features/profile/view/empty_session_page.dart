import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';

import '../../auth/view/login_page.dart';
import '../../auth/view/register_page.dart';

class EmptyUserPage extends StatefulWidget {
  const EmptyUserPage({Key? key}) : super(key: key);

  @override
  State<EmptyUserPage> createState() => _EmptyUserPageState();
}

class _EmptyUserPageState extends State<EmptyUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saya")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            64.0.height,
            const Image(
              image: AppIcons.welcome,
            ),
            const SizedBox(height: AppSizes.primary),
            const Text(
              "Yah, kamu belum Log In",
              style: TextStyle(
                  fontSize: AppSizes.secondary,
                  color: AppColors.black,
                  fontWeight: AppFontWeight.bold),
            ),
            const Text(
              "Yuk, Log In dahulu untuk melihat halaman ini",
              style: TextStyle(
                fontSize: AppSizes.primary,
                color: AppColors.grey500,
              ),
              textAlign: TextAlign.center,
            ),
            20.0.height,
            Padding(
              padding: const EdgeInsets.all(AppSizes.primary),
              child: Column(children: [
                EcoFormButton(
                  label: 'Register',
                  onPressed: () {
                    context.push(const RegisterPage());
                  },
                  backgroundColor: AppColors.primary500,
                ),
                10.0.height,
                EcoFormButton(
                  label: 'Login',
                  textColor: AppColors.primary500,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: AppColors.primary50,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
