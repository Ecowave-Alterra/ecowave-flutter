import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../model/review_model.dart';

class ReviewListWidget extends StatelessWidget {
  const ReviewListWidget({super.key, this.review});
  final ReviewModel? review;

  @override
  Widget build(BuildContext context) {
    final List<ReviewModel> reviews = [
      ReviewModel(
        photoReviewer: const AssetImage(AppImages.cardInfo4),
        namaReviewer: 'Muhammad Nabil',
        bintangReviewer: 5,
        deskripsiReviewer: 'Keren bangetttt, recommend banget!!',
        reviewPhoto: Image.asset(AppImages.productShop2),
      ),
      ReviewModel(
        photoReviewer: const AssetImage(AppImages.cardInfo4),
        namaReviewer: 'Muhammad Nabil',
        bintangReviewer: 4,
        deskripsiReviewer:
            'Menjelaskan produk ini dapat digunakan untuk apa dan apa manfaat dari produk ini.',
      ),
      ReviewModel(
        photoReviewer: const AssetImage(AppImages.cardInfo6),
        namaReviewer: 'Karina',
        bintangReviewer: 3,
        deskripsiReviewer: 'Pengirimannya lama:(',
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
                      backgroundImage: reviews[index].photoReviewer,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      reviews[index].namaReviewer,
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
                initialRating: reviews[index].bintangReviewer,
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
                reviews[index].deskripsiReviewer ?? 'tidak ada deskripsi',
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
