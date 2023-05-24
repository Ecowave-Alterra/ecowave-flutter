import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nilai Produk"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 11,
            ),
            const Text(
              "Puas dengan pesananmu?",
              style: TextStyle(fontWeight: AppFontWeight.medium),
            ),
            const Text("Berikan Rating sekarang juga untuk mendapatkan point!"),
            20.0.height,
          ],
        ),
      ),
    );
  }
}
