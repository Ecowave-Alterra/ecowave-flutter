import 'package:ecowave/features/information/view/widget/list_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmark',
          style: GoogleFonts.poppins(
            fontSize: 30,
            fontWeight: AppFontWeight.regular,
            color: AppColors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          24.0.height,
          const ListInformation(
            image: AppImages.cardInfo6,
            date: '4 Mei 2023',
            info:
                'Peduli Lingkungan, Yuk Mulai Ganti Botol Plastik dengan Tumblr',
          ),
          const Divider(
            color: AppColors.grey50,
          ),
          const ListInformation(
            image: AppImages.cardInfo4,
            date: '5 Mei 2023',
            info:
                'Menjaga Lingkungan Hidup dengan Melakukan Enam Langkah Pelestarian',
          ),
        ],
      ),
    );
  }
}
