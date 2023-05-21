import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselGambar extends StatefulWidget {
  const CarouselGambar({super.key});

  @override
  State<CarouselGambar> createState() => _CarouselGambarState();
}

class _CarouselGambarState extends State<CarouselGambar> {
  List<Widget> imgList = [
    ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox.fromSize(
        child: Image.asset(
          AppImages.cardShop1,
          fit: BoxFit.fill,
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox.fromSize(
        child: Image.asset(
          AppImages.cardShop2,
          fit: BoxFit.fill,
        ),
      ),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: SizedBox.fromSize(
        child: Image.asset(
          AppImages.cardShop3,
          fit: BoxFit.fill,
        ),
      ),
    ),
  ];
  final CarouselController _controller = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: AppSizes.primary, bottom: AppSizes.primary),
        child: SizedBox(
          height: 198,
          child: Column(children: [
            Expanded(
              child: CarouselSlider(
                items: imgList,
                carouselController: _controller,
                options: CarouselOptions(
                    height: 198,
                    autoPlay: true,
                    enlargeCenterPage: true,
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
                    height: 32.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ]),
        ));
  }
}
