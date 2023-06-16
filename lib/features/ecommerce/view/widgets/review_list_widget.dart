import 'package:ecowave/core.dart';
import 'package:ecowave/features/ecommerce/model/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewListWidget extends StatelessWidget {
  const ReviewListWidget({super.key, required this.review});
  final ProductModel review;

  @override
  Widget build(BuildContext context) {
    final List<Review> reviews =
        List.generate(review.review.length, (index) => review.review[index]);
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
                      backgroundImage:
                          NetworkImage(reviews[index].profilePhotoUrl),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      reviews[index].fullName,
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
                initialRating: reviews[index].rating,
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
            Visibility(
                visible: reviews[index].photoUrl != '',
                child: ImageReview(image: reviews[index].photoUrl)),
            Container(
              padding: const EdgeInsets.only(
                  left: AppSizes.primary, right: AppSizes.primary),
              alignment: Alignment.centerLeft,
              child: Text(
                reviews[index].comment,
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
  final String? image;

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
        child: Image.network(image ??
            'https://storage.googleapis.com/ecowave/img/products/bottle.png'),
      );
    }
  }
}
