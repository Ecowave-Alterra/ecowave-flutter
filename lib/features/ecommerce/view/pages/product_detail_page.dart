import 'package:ecowave/features/ecommerce/view/widgets/product_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core.dart';
import '../../../payment/view/pages/payment_detail_page.dart';
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
              onPressed: () => context.push(const PaymentDetailPage()),
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
        padding: const EdgeInsets.all(8.0),
        height: 80.0,
        child: Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Container(
                height: 48.0,
                width: 171.0,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary50),
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.primary50,
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AppIcons.keranjang,
                        size: 15.0,
                        color: AppColors.primary500,
                      ),
                      SizedBox(
                        width: 6.5,
                      ),
                      Text(
                        'Keranjang',
                        style: TextStyle(
                          color: AppColors.primary500,
                          fontWeight: AppFontWeight.semibold,
                          fontSize: AppSizes.buttonFontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                height: 48.0,
                width: 171.0,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary500),
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.primary500,
                ),
                child: const Center(
                  child: Text(
                    'Pesan Sekarang',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: AppFontWeight.semibold,
                      fontSize: AppSizes.buttonFontSize,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
