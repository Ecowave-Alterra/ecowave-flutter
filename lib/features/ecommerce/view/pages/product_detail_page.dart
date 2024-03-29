import 'package:ecowave/features/cart/view/pages/cart_page.dart';
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

  const ProductDetail({
    super.key,
    required this.productModel,
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
                  productModel: productModel,
                );
              },
            ),
            ProductDescription(
              productModel: productModel,
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
                onPressed: productModel.stock == 0
                    ? null
                    : () {
                        context.read<CartBloc>().add(
                              AddItemCart(
                                cartModel: CartModel(
                                  id: productModel.productId,
                                  nameItems: productModel.name,
                                  detailItems: productModel.category,
                                  image: (productModel
                                          .productImageUrl!.isNotEmpty)
                                      ? (productModel.productImageUrl?[0] ??
                                          'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg')
                                      : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                  price: productModel.price.toInt(),
                                  stock: productModel.stock,
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
              ),
            ),
            const SizedBox(
              width: AppSizes.primary,
            ),
            Flexible(
              child: EcoFormButton(
                onPressed: productModel.stock == 0
                    ? null
                    : () {
                        context.push(PaymentDetailPage(
                          carts: [
                            CartModel(
                              id: productModel.productId,
                              nameItems: productModel.name,
                              detailItems: productModel.category,
                              image: (productModel.productImageUrl!.isNotEmpty)
                                  ? (productModel.productImageUrl?[0] ??
                                      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg')
                                  : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                              price: productModel.price.toInt(),
                              stock: productModel.stock,
                              totalItems: 1,
                              checkedItems: false,
                            ),
                          ],
                        ));
                      },
                label: "Pesan Sekarang",
                height: 48.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
