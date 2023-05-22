import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core.dart';

class EmptyAddress extends StatelessWidget {
  const EmptyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const ImageIcon(AppIcons.leftBack,
              color: AppColors.primary500, size: 12),
        ),
        title: Text(
          'Alamat Saya anda',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: AppFontWeight.regular,
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(AppIcons.add,
                color: AppColors.primary500, size: 12),
          ),
        ],
        backgroundColor: AppColors.white,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grey300,
            height: 2.0,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.emptyState,
              width: 181,
            ),
            12.0.height,
            Text(
              'Kamu belum menambahkan alamat',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: AppFontWeight.semibold,
                color: AppColors.grey500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
