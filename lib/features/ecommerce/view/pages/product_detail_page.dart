import 'package:ecowave/features/cart/view/pages/cart_page.dart';
import 'package:ecowave/features/ecommerce/bloc/product_category/product_category_bloc.dart';
import 'package:ecowave/features/ecommerce/model/models/product_model.dart';
import 'package:ecowave/features/ecommerce/view/widgets/product_description_widget.dart';
import 'package:ecowave/features/payment/view/pages/payment_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core.dart';
import '../../../cart/bloc/cart/cart_bloc.dart';
import '../../../cart/model/models/cart_model.dart';
import '../../bloc/product_home/product_bloc.dart';
import '../widgets/carousel_barang_widget.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel productModel;
  final int productId;
  final int productCategoryId;

  const ProductDetail({
    super.key,
    required this.productModel,
    required this.productId,
    required this.productCategoryId,
  });

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
              child: BlocBuilder<ProductCategoryBloc, ProductCategoryState>(
                builder: (context, state) {
                  if (state is ProductCategorySuccess) {
                    return EcoFormButtonIcon(
                      onPressed: () {
                        context.read<CartBloc>().add(
                              AddItemCart(
                                cartModel: CartModel(
                                  id: productModel.id.toString(),
                                  nameItems: productModel.name,
                                  detailItems: state.data[0].category,
                                  image:
                                      'assets/images/productShop${productModel.id}.png',
                                  price: productModel.price.toInt(),
                                  totalItems: 1,
                                  checkedItems: false,
                                ),
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
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
            const SizedBox(
              width: AppSizes.primary,
            ),
            Flexible(
              child: BlocBuilder<ProductCategoryBloc, ProductCategoryState>(
                builder: (context, state) {
                  if (state is ProductCategorySuccess) {
                    return EcoFormButton(
                      onPressed: () => context.push(PaymentDetailPage(
                        carts: [
                          CartModel(
                            id: productModel.id.toString(),
                            nameItems: productModel.name,
                            detailItems: state.data[0].category,
                            image:
                                'assets/images/productShop${productModel.id}.png',
                            price: productModel.price.toInt(),
                            totalItems: 1,
                            checkedItems: false,
                          ),
                        ],
                      )),
                      label: "Pesan Sekarang",
                      height: 48.0,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
