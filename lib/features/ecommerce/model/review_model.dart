import 'package:flutter/material.dart';

class ReviewModel {
  final ImageProvider? reviewerPhoto;
  final String reviewerName;
  final double reviewerStar;
  final String? reviewerDesc;
  final Image? reviewPhoto;

  ReviewModel({
    this.reviewerPhoto,
    required this.reviewerName,
    required this.reviewerStar,
    this.reviewerDesc,
    this.reviewPhoto,
  });
}
