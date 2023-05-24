import 'package:flutter/material.dart';

class ReviewModel {
  final ImageProvider? photoReviewer;
  final String namaReviewer;
  late final int bintangReviewer;
  final String? deskripsiReviewer;
  final Image? reviewPhoto;

  ReviewModel({
    this.photoReviewer,
    required this.namaReviewer,
    required this.bintangReviewer,
    this.deskripsiReviewer,
    this.reviewPhoto,
  });
}
