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
      body: Column(
        children: [
          24.0.height,
          // const ListInformation(
          //   image: AppImages.cardInfo6,
          //   date: '4 Mei 2023',
          //   info:
          //       'Peduli Lingkungan, Yuk Mulai\nGanti Botol Plastik dengan\nTumblr',
          //       informationModel: infor,
          // ),
          // const Divider(
          //   color: AppColors.grey50,
          // ),
          // const ListInformation(
          //   image: AppImages.cardInfo4,
          //   date: '5 Mei 2023',
          //   info:
          //       'Menjaga Lingkungan Hidup\ndengan Melakukan Enam\nLangkah Pelestarian',
          // ),
        ],
      ),
    );
  }
}
