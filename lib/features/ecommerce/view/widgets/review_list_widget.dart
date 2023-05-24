import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

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
        photoReviewer: const AssetImage(AppImages.cardInfo3),
        namaReviewer: 'Muhammad Nabil',
        bintangReviewer: 4,
        deskripsiReviewer:
            'Menjelaskan produk ini dapat digunakan untuk apa dan apa manfaat dari produk ini.',
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
              padding: const EdgeInsets.only(left: AppSizes.primary),
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
            StarWidget(star: reviews[index].bintangReviewer),
            ImageReview(image: reviews[index].reviewPhoto),
            Container(
              padding: const EdgeInsets.only(
                  left: AppSizes.primary, right: AppSizes.primary),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Menjelaskan produk ini dapat digunakan untuk apa dan apa manfaat dari produk ini.',
                style: TextStyle(
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

class StarWidget extends StatelessWidget {
  const StarWidget({super.key, required this.star});
  final int star;

  @override
  Widget build(BuildContext context) {
    if (star == 1) {
      return Container(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 0, 0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.outlineUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.outlineUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.outlineUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.outlineUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
          ],
        ),
      );
    } else if (star == 2) {
      return Container(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 0, 0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.outlineUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.outlineUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.outlineUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
          ],
        ),
      );
    } else if (star == 3) {
      return Container(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 0, 0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.outlineUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.outlineUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
          ],
        ),
      );
    } else if (star == 4) {
      return Container(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 0, 0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.outlineUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 0, 0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.57),
              child: const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
            ),
          ],
        ),
      );
    }
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
