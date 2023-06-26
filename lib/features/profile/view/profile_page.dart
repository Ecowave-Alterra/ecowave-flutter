import 'package:ecowave/core.dart';
import 'package:ecowave/features/home/bloc/home/home_bloc.dart';
import 'package:ecowave/features/profile/bloc/profile_bloc.dart';
import 'package:ecowave/features/profile/view/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../address/view/pages/address_page.dart';
import '../../change_password/view/change_password_user_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saya'),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.user.email == '') {
            context.read<ProfileBloc>().add(GetDataUser());
          }
          return ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.0.height,
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSizes.primary),
                      child: Text(
                        "Saya",
                        style: TextStyle(
                          fontSize: AppSizes.secondary,
                          fontWeight: AppFontWeight.bold,
                        ),
                      ),
                    ),
                    16.0.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.primary),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 30.0,
                            backgroundColor: AppColors.primary50,
                            child: ClipOval(
                              child: Image(
                                image: AppIcons.profile,
                                width: 30,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user.name,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.black,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                state.user.username,
                                style: const TextStyle(
                                  color: AppColors.grey500,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    20.0.height,
                    const Divider(
                      thickness: 1,
                      color: AppColors.grey50,
                    ),
                    8.0.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
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
                            state.user.email,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.grey700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    16.0.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
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
                            state.user.phone,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.grey700,
                            ),
                          ),
                        ],
                      ),
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
                        padding: EdgeInsets.all(AppSizes.primary),
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
                                  'Dalam pengembangan ',
                                  style: TextStyle(
                                    color: AppColors.grey300,
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
                const Divider(
                  thickness: 10,
                  color: AppColors.grey50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.primary,
                          vertical: AppSizes.primary / 2),
                      child: Text(
                        "Akun",
                        style: TextStyle(
                          fontSize: AppSizes.primary,
                          fontWeight: AppFontWeight.extrabold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.push(const EditProfilePage());
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(AppSizes.primary),
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
                    const SizedBox(
                      height: 8,
                      child: Divider(
                        color: AppColors.grey50,
                      ),
                    ),
                    InkWell(
                        onTap: () => context.push(const AddressPage()),
                        child: const Padding(
                          padding: EdgeInsets.all(AppSizes.primary),
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
                const Divider(
                  thickness: 10,
                  color: AppColors.grey50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.primary,
                          vertical: AppSizes.primary / 2),
                      child: Text(
                        "Keamanan",
                        style: TextStyle(
                          fontSize: AppSizes.primary,
                          fontWeight: AppFontWeight.extrabold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.push(const ChangePasswordUserPage());
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(AppSizes.primary),
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
                BlocListener<HomeBloc, HomeState>(
                  listener: (context, state) {},
                  child: Container(
                    color: AppColors.grey50,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: EcoFormButton(
                        label: 'Log out',
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.remove('token');
                          if (context.mounted) {
                            "Kamu berhasil keluar dari akun"
                                .succeedBar(context);
                            context.read<ProfileBloc>().add(DeleteDataUser());
                            context.read<HomeBloc>().add(LogOut());
                          }
                        },
                        backgroundColor: AppColors.error500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]);
        },
      ),
    );
  }
}
