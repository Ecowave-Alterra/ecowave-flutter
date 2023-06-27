import 'package:ecowave/features/ecommerce/model/models/product_model.dart';
import 'package:ecowave/features/ecommerce/view/widgets/review_list_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core.dart';

class ProductReview extends StatelessWidget {
  final ProductModel productModel;
  const ProductReview({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ulasan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 0.0),
              child: Row(
                children: [
                  const ImageIcon(
                    AppIcons.solidUlasan,
                    color: AppColors.warning500,
                    size: 14.24,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      productModel.averageRating.toString(),
                      style: const TextStyle(
                          fontSize: AppSizes.primary,
                          fontWeight: AppFontWeight.semibold,
                          color: AppColors.black),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 2.0, bottom: 2.0),
                    child: Text(
                      '${(productModel.review?.length ?? 0)} penilaian',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: AppFontWeight.medium,
                          color: AppColors.grey700),
                    ),
                  ),
                ],
              ),
            ),
            ReviewListWidget(review: productModel),
          ],
        ),
      ),
    );
  }
}
