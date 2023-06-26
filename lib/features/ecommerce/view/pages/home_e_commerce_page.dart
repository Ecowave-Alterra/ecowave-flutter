import 'package:ecowave/core.dart';
import 'package:ecowave/features/cart/bloc/cart/cart_bloc.dart';
import 'package:ecowave/features/cart/view/pages/cart_page.dart';
import 'package:ecowave/features/ecommerce/view/widgets/card_product_widget.dart';
import 'package:ecowave/features/ecommerce/view/widgets/carousel_widget.dart';
import 'package:ecowave/features/ecommerce/view/widgets/searchbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeECommerce extends StatelessWidget {
  const HomeECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CartBloc>().add(GetItemCart());

    return Scaffold(
      appBar: AppBar(
        title: const Text("EcoShop"),
        actions: [
          IconButton(
            onPressed: () {
              context.push(const CartPage());
              FocusScope.of(context).unfocus();
            },
            icon: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartSuccess) {
                  if (state.data.isEmpty) {
                    return const ImageIcon(
                      AppIcons.keranjang,
                      color: AppColors.primary500,
                    );
                  }
                  return Badge(
                    backgroundColor: AppColors.primary500,
                    label: Text(state.data.length.toString()),
                    child: const ImageIcon(
                      AppIcons.keranjang,
                      color: AppColors.primary500,
                    ),
                  );
                }
                return const ImageIcon(
                  AppIcons.keranjang,
                  color: AppColors.primary500,
                );
              },
            ),
            iconSize: 22.0,
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
