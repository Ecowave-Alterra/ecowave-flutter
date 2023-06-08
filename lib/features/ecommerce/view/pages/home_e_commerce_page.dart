import 'package:ecowave/core.dart';
import 'package:ecowave/features/cart/view/pages/cart_page.dart';
import 'package:ecowave/features/ecommerce/view/widgets/card_product_widget.dart';
import 'package:ecowave/features/ecommerce/view/widgets/carousel_widget.dart';
import 'package:ecowave/features/ecommerce/view/widgets/searchbar_widget.dart';
import 'package:flutter/material.dart';

class HomeECommerce extends StatelessWidget {
  const HomeECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EcoShop"),
        actions: [
          IconButton(
            onPressed: () => context.push(const CartPage()),
            icon: const ImageIcon(
              AppIcons.keranjang,
              color: AppColors.primary500,
            ),
            iconSize: 18,
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBarWidget(),
            CarouselGambar(),
            CardProduct(),
          ],
        ),
      ),
    );
  }
}
