import 'package:ecowave/core.dart';
import 'package:ecowave/features/information/view/pages/bookmark_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widget/carousel_information_card_widget.dart';
import '../widget/list_information_widget.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> carouselInfo = const [
    CarouselCardInformation(
      images: AppImages.cardInfo1,
      info: 'Lingkungan Rusak Karena\nKepentingan Pribadi?',
    ),
    CarouselCardInformation(
      images: AppImages.cardInfo2,
      info: 'Lingkungan Rusak Karena\nKepentingan Pribadi?',
    ),
    CarouselCardInformation(
      images: AppImages.cardInfo3,
      info: 'Lingkungan Rusak Karena\nKepentingan Pribadi?',
    ),
    CarouselCardInformation(
      images: AppImages.cardInfo4,
      info: 'Lingkungan Rusak Karena\nKepentingan Pribadi?',
    ),
    CarouselCardInformation(
      images: AppImages.cardInfo5,
      info: 'Lingkungan Rusak Karena\nKepentingan Pribadi?',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const ImageIcon(AppIcons.leftBack,
              color: AppColors.primary500, size: 11),
        ),
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Eco',
              style: TextStyle(
                fontSize: 28,
                fontWeight: AppFontWeight.semibold,
                color: AppColors.primary500,
              ),
            ),
            Text(
              'Info',
              style: TextStyle(
                fontSize: 28,
                fontWeight: AppFontWeight.semibold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(const BookmarkPage());
            },
            icon: const ImageIcon(AppIcons.outlineBookmark,
                color: AppColors.primary600, size: 18),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.0.height,
            CarouselSlider(
              carouselController: _controller,
              items: carouselInfo,
              options: CarouselOptions(
                height: 150,
                initialPage: 1,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _current = index;
                    },
                  );
                },
              ),
            ),
            18.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselInfo.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == entry.key
                          ? AppColors.primary500
                          : const Color(0xffD9D9D9),
                    ),
                  ),
                );
              }).toList(),
            ),
            59.0.height,
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
            const Divider(
              color: AppColors.grey50,
            ),
            const ListInformation(
              image: AppImages.cardInfo7,
              date: '5 Mei 2023',
              info:
                  'Tetap Trendi dengan Produk\nBerkelanjutan yang Ramah Lingkungan',
            ),
            16.0.height,
          ],
        ),
      ),
    );
  }
}
