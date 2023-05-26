import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../core.dart';

class CarouselBarang extends StatefulWidget {
  const CarouselBarang({super.key});

  @override
  State<CarouselBarang> createState() => _CarouselBarangState();
}

class _CarouselBarangState extends State<CarouselBarang> {
  List<Widget> imgList = [
    SizedBox.fromSize(
      child: Image.asset(
        AppImages.productShop2,
        fit: BoxFit.cover,
      ),
    ),
    SizedBox.fromSize(
      child: Image.asset(
        AppImages.productShop2,
        fit: BoxFit.cover,
      ),
    ),
    SizedBox.fromSize(
      child: Image.asset(
        AppImages.productShop2,
        fit: BoxFit.cover,
      ),
    ),
    SizedBox.fromSize(
      child: Image.asset(
        AppImages.productShop2,
        fit: BoxFit.cover,
      ),
    ),
    SizedBox.fromSize(
      child: Image.asset(
        AppImages.productShop2,
        fit: BoxFit.cover,
      ),
    ),
  ];
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 10, 16),
        child: SizedBox(
          height: 358,
          child: Column(children: [
            Expanded(
              child: CarouselSlider(
                items: imgList,
                carouselController: _controller,
                options: CarouselOptions(
                    height: 358,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? AppColors.black
                                : AppColors.primary500)
                            .withOpacity(_current == entry.key ? 0.9 : 0.2)),
                  ),
                );
              }).toList(),
            ),
          ]),
        ));
  }
}
