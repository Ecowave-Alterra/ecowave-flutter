import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../model/models/rating_product_model.dart';

class ReviewListWidget extends StatelessWidget {
  const ReviewListWidget({super.key, this.review});
  final RatingProductModel? review;

  @override
  Widget build(BuildContext context) {
    final List<RatingProductModel> reviews = [
      RatingProductModel(
        reviewerPhoto: const AssetImage(AppImages.cardInfo4),
        reviewerName: 'Muhammad Nabil',
        reviewerStar: 5,
        reviewerDesc: 'Keren bangetttt, recommend banget!!',
        reviewPhoto: Image.asset(AppImages.productShop2),
      ),
      RatingProductModel(
        reviewerPhoto: const AssetImage(AppImages.cardInfo4),
        reviewerName: 'Muhammad Nabil',
        reviewerStar: 4,
        reviewerDesc:
            'Menjelaskan produk ini dapat digunakan untuk apa dan apa manfaat dari produk ini.',
      ),
      RatingProductModel(
        reviewerPhoto: const AssetImage(AppImages.cardInfo6),
        reviewerName: 'Karina',
        reviewerStar: 3,
        reviewerDesc: 'Pengirimannya lama:(',
      ),
    ];
    return ListView.builder(
      shrinkWrap: true,
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: AppSizes.primary, top: AppSizes.primary),
              child: Row(
                children: [
                  SizedBox(
                    width: 30.0,
                    height: 40.0,
                    child: CircleAvatar(
                      backgroundImage: reviews[index].reviewerPhoto,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      reviews[index].reviewerName,
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: AppFontWeight.medium,
                          color: AppColors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20.0,
              padding: const EdgeInsets.fromLTRB(16.0, 4.0, 0.0, 4.0),
              child: RatingBar(
                initialRating: reviews[index].reviewerStar,
                ignoreGestures: true,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemSize: 14.24,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: const ImageIcon(
                    AppIcons.solidUlasan,
                    color: AppColors.warning500,
                  ),
                  half: const ImageIcon(
                    AppIcons.outlineUlasan,
                    color: AppColors.warning500,
                  ),
                  empty: const ImageIcon(
                    AppIcons.outlineUlasan,
                    color: AppColors.warning500,
                  ),
                ),
                itemPadding: const EdgeInsets.only(right: 4),
                onRatingUpdate: (rating) {},
              ),
            ),
            ImageReview(image: reviews[index].reviewPhoto),
            Container(
              padding: const EdgeInsets.only(
                  left: AppSizes.primary, right: AppSizes.primary),
              alignment: Alignment.centerLeft,
              child: Text(
                reviews[index].reviewerDesc ?? 'tidak ada deskripsi',
                style: const TextStyle(
                  fontSize: AppSizes.primary,
                  fontWeight: AppFontWeight.regular,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ImageReview extends StatelessWidget {
  const ImageReview({super.key, this.image});
  final Image? image;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return const SizedBox(
        height: 0.0,
      );
    } else {
      return Container(
        height: 100.0,
        width: 100.0,
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 4.0, 16.0),
        child: image,
      );
    }
  }
}
