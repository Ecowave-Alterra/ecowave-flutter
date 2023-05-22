import 'package:ecowave/features/information/view/widget/list_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const ImageIcon(AppIcons.leftBack,
                color: AppColors.primary500, size: 11),
          ),
          title: Text(
            'Bookmark',
            style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: AppFontWeight.regular,
              color: AppColors.black,
            ),
          ),
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
        body: Column(
          children: [
            24.0.height,
            const ListInformation(
              image: AppImages.cardInfo6,
              date: '4 Mei 2023',
              info:
                  'Peduli Lingkungan, Yuk Mulai\nGanti Botol Plastik dengan\nTumblr',
            ),
            const Divider(
              color: AppColors.grey50,
            ),
            const ListInformation(
              image: AppImages.cardInfo4,
              date: '5 Mei 2023',
              info:
                  'Menjaga Lingkungan Hidup\ndengan Melakukan Enam\nLangkah Pelestarian',
            ),
          ],
        ),
      ),
    );
  }
}
