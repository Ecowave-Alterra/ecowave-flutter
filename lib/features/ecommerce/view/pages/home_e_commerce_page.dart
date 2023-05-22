import 'package:ecowave/core.dart';
import 'package:ecowave/features/ecommerce/view/widgets/card_barang_widget.dart';
import 'package:ecowave/features/ecommerce/view/widgets/carousel_widget.dart';
import 'package:ecowave/features/ecommerce/view/widgets/searchbar_widget.dart';
import 'package:flutter/material.dart';

class HomeECommerce extends StatelessWidget {
  const HomeECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const ImageIcon(
            AppIcons.leftBack,
            color: AppColors.primary500,
          ),
          iconSize: 11.98,
        ),
        title: const Text("EcoShop"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AppIcons.keranjang,
              color: AppColors.primary500,
            ),
            iconSize: 18,
          ),
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBarWidget(),
          CarouselGambar(),
          CardBarang(),
        ],
      ),
    );
  }
}