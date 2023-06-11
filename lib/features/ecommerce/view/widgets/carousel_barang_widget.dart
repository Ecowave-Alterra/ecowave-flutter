import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecowave/features/ecommerce/bloc/product_image/product_image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core.dart';

class CarouselBarang extends StatefulWidget {
  final int productId;
  const CarouselBarang({super.key, required this.productId});

  @override
  State<CarouselBarang> createState() => _CarouselBarangState();
}

class _CarouselBarangState extends State<CarouselBarang> {
  final CarouselController _controller = CarouselController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    context
        .read<ProductImageBloc>()
        .add(GetProductImageEvent(widget.productId));
    return BlocBuilder<ProductImageBloc, ProductImageState>(
      builder: (context, state) {
        if (state is ProductImageLoading) {
          return const EcoLoading();
        } else if (state is ProductImageFailed) {
          return EcoError(
            errorMessage: state.message,
            onRetry: () {},
          );
        } else if (state is ProductImageSuccess) {
          List<Widget> imgList = List.generate(
            state.data.length,
            (index) {
              final img = state.data[index];
              return SizedBox.fromSize(
                child: Image.asset(
                  img.productImageUrl,
                  fit: BoxFit.contain,
                ),
              );
            },
          );
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
                        viewportFraction: 1.0,
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
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                        ? AppColors.black
                                        : AppColors.primary500)
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.2)),
                      ),
                    );
                  }).toList(),
                ),
              ]),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
