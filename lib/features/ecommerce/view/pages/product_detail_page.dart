import 'package:ecowave/features/cart/view/pages/cart_page.dart';
import 'package:ecowave/features/ecommerce/view/widgets/product_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../core.dart';
import '../../../cart/bloc/cart/cart_bloc.dart';
import '../../../cart/model/models/cart_model.dart';
import '../../bloc/product_home/product_bloc.dart';
import '../widgets/carousel_barang_widget.dart';

class ProductDetail extends StatelessWidget {
  final int productId;
  final int productCategoryId;
  const ProductDetail(
      {super.key, required this.productId, required this.productCategoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
          title: const Text("Detail Barang"),
          actions: [
            IconButton(
              onPressed: () => context.push(const CartPage()),
              icon: const ImageIcon(
                AppIcons.keranjang,
                color: AppColors.primary500,
              ),
              iconSize: 18.0,
            ),
          ],
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<ProductBloc>().add(GetProductEvent());
            },
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return CarouselBarang(
                  productId: productId,
                );
              },
            ),
            ProductDescription(
              productId: productId,
              productCategoryId: productCategoryId,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        height: 80.0,
        child: Row(
          children: [
            Flexible(
              child: EcoFormButtonIcon(
                onPressed: () {
                  final String id = const Uuid().v1();
                  context.read<CartBloc>().add(
                        AddItemCart(
                          cartModel: CartModel(
                              id: id,
                              nameItems: 'Tote Bag Putih Polos',
                              detailItems: 'Kategori : Kantong',
                              image: AppImages.productShop2,
                              price: 5000,
                              totalItems: 1,
                              checkedItems: false),
                        ),
                      );
                },
                label: "Keranjang",
                image: const Image(
                  image: AppIcons.keranjang,
                  width: AppSizes.primary,
                  height: AppSizes.primary,
                ),
                height: 48.0,
                backgroundColor: AppColors.primary50,
                textColor: AppColors.primary500,
              ),
            ),
            const SizedBox(
              width: AppSizes.primary,
            ),
            Flexible(
              child: EcoFormButton(
                onPressed: () {},
                label: "Pesan Sekarang",
                height: 48.0,
              ),
            ),
            // TextButton(
            //   onPressed: () {},
            //   child: Container(
            //     height: 48.0,
            //     width: 171.0,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: AppColors.primary50),
            //       borderRadius: BorderRadius.circular(100),
            //       color: AppColors.primary50,
            //     ),
            //     child: const Center(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           ImageIcon(
            //             AppIcons.keranjang,
            //             size: 15.0,
            //             color: AppColors.primary500,
            //           ),
            //           SizedBox(
            //             width: 6.5,
            //           ),
            //           Text(
            //             'Keranjang',
            //             style: TextStyle(
            //               color: AppColors.primary500,
            //               fontWeight: AppFontWeight.semibold,
            //               fontSize: AppSizes.buttonFontSize,
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // TextButton(
            //   onPressed: () {},
            //   child: Container(
            //     height: 48.0,
            //     width: 171.0,
            //     decoration: BoxDecoration(
            //       border: Border.all(color: AppColors.primary500),
            //       borderRadius: BorderRadius.circular(100),
            //       color: AppColors.primary500,
            //     ),
            //     child: const Center(
            //       child: Text(
            //         'Pesan Sekarang',
            //         style: TextStyle(
            //           color: AppColors.white,
            //           fontWeight: AppFontWeight.semibold,
            //           fontSize: AppSizes.buttonFontSize,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
