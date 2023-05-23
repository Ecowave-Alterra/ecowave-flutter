import 'package:ecowave/features/ecommerce/view/widgets/deskripsi_barang_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core.dart';
import '../../../payment/view/pages/payment_detail_page.dart';
import '../widgets/carousel_barang_widget.dart';

class DetailBarang extends StatelessWidget {
  const DetailBarang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Detail Barang"),
        actions: [
          IconButton(
            onPressed: () => context.push(const PaymentDetailPage()),
            icon: const ImageIcon(
              AppIcons.keranjang,
              color: AppColors.primary500,
            ),
            iconSize: 18,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselBarang(),
            DeskripsiBarang(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),
        height: 80,
        child: Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Container(
                height: 48.0,
                width: 171,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary50),
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.primary50,
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AppIcons.keranjang,
                        size: 15,
                        color: AppColors.primary500,
                      ),
                      SizedBox(
                        width: 6.5,
                      ),
                      Text(
                        'Keranjang',
                        style: TextStyle(
                          color: AppColors.primary500,
                          fontWeight: AppFontWeight.semibold,
                          fontSize: AppSizes.buttonFontSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                height: 48.0,
                width: 171,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary500),
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.primary500,
                ),
                child: const Center(
                  child: Text(
                    'Pesan Sekarang',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: AppFontWeight.semibold,
                      fontSize: AppSizes.buttonFontSize,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
