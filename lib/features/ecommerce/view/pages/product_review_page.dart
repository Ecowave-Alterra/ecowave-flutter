import 'package:ecowave/features/ecommerce/view/widgets/review_list_widget.dart';
import 'package:flutter/material.dart';

class ProductReview extends StatelessWidget {
  const ProductReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ulasan"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewListWidget(),
        ],
      ),
    );
  }
}
