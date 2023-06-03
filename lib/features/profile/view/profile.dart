import 'package:ecowave/core.dart';
import 'package:ecowave/features/profile/view/edit_profile.dart';
import 'package:flutter/material.dart';

import '../../address/view/pages/address_page.dart';
import '../../change_password/view/change_password_user_page.dart';
import 'empty_session.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saya'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSizes.primary),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.0.height,
                      const Text(
                        "Saya",
                        style: TextStyle(
                          fontSize: AppSizes.secondary,
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                      16.0.height,
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundColor: AppColors.primary50,
                            child: ClipOval(
                              child: Image(
                                image: AppIcons.profile,
                                width: 30,
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fauzi Maulia Tarigan',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '@username',
                                style: TextStyle(
                                  color: AppColors.grey500,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      20.0.height,
                      const Divider(
                        thickness: 1,
                        color: AppColors.grey50,
                      ),
                      8.0.height,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ImageIcon(
                                size: 20,
                                AppIcons.email,
                                color: AppColors.primary500,
                              ),
                              SizedBox(width: AppSizes.primary),
                              Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.grey700,
                                  fontWeight: AppFontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Fauzi@gmail.com',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.grey700,
                            ),
                          ),
                        ],
                      ),
                      16.0.height,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ImageIcon(
                                size: 20,
                                AppIcons.numberPhone,
                                color: AppColors.primary500,
                              ),
                              SizedBox(width: AppSizes.primary),
                              Text(
                                'No. Telepon',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.grey700,
                                  fontWeight: AppFontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '0812345678910',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.grey700,
                            ),
                          ),
                        ],
                      ),
                      8.0.height,
                      const Divider(
                        thickness: 1,
                        color: AppColors.grey50,
                      ),
                      InkWell(
                        onTap: () {
                          // Tindakan yang dijalankan saat tombol diklik
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: AppSizes.primary / 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ImageIcon(
                                    size: 20,
                                    AppIcons.coin,
                                    color: AppColors.primary500,
                                  ),
                                  SizedBox(width: AppSizes.primary),
                                  Text(
                                    'EcoPoints',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.grey700,
                                      fontWeight: AppFontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Lihat Detail ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.grey700,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14,
                                    color: AppColors.grey700,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              color: AppColors.grey50,
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Akun",
                    style: TextStyle(
                      fontSize: AppSizes.primary,
                      fontWeight: AppFontWeight.extrabold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push(const EditProfilePage());
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: AppSizes.primary / 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ImageIcon(
                                size: 20,
                                AppIcons.ubahProfil,
                                color: AppColors.primary500,
                              ),
                              SizedBox(width: AppSizes.primary),
                              Text(
                                'Ubah Profile',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.grey700,
                                  fontWeight: AppFontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: AppColors.grey700,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: AppColors.grey50,
                  ),
                  InkWell(
                      onTap: () => context.push(const AddressPage(listUser: [])),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: AppSizes.primary / 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ImageIcon(
                                  size: 20,
                                  AppIcons.alamat,
                                  color: AppColors.primary500,
                                ),
                                SizedBox(width: AppSizes.primary),
                                Text(
                                  'Alamat',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.grey700,
                                    fontWeight: AppFontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: AppColors.grey700,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              color: AppColors.grey50,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Keamanan",
                    style: TextStyle(
                      fontSize: AppSizes.primary,
                      fontWeight: AppFontWeight.extrabold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push(const ChangePasswordUserPage());
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: AppSizes.primary / 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ImageIcon(
                                size: 20,
                                AppIcons.password,
                                color: AppColors.primary500,
                              ),
                              SizedBox(width: AppSizes.primary),
                              Text(
                                'Ubah Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.grey700,
                                  fontWeight: AppFontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: AppColors.grey700,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: AppColors.grey50,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: EcoFormButton(
                  label: 'Log out',
                  onPressed: () {
                    context.push(const EmptyUserPage());
                  },
                  backgroundColor: AppColors.error500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
