import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

class SelectedProductCard extends StatelessWidget {
  const SelectedProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://d1r7omh34z6onh.cloudfront.net/gk/production/9a09064d2bcf10b0f3292fea071406bb.jpg",
            width: 55.0,
            height: 55.0,
            fit: BoxFit.cover,
          ),
          16.0.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nama Produk",
                style: TextStyle(
                  fontWeight: AppFontWeight.semibold,
                ),
              ),
              12.0.height,
              const Text("Detail : Rumah Tangga/Kain"),
              12.0.height,
              const Text("1 Barang"),
              12.0.height,
              Text(
                50000.currencyFormatRp,
                style: const TextStyle(
                  fontWeight: AppFontWeight.semibold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
