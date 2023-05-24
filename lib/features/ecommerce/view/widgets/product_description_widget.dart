import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: AppSizes.primary),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Tote Bag Putih Polos',
            style: TextStyle(
              fontSize: AppSizes.primary,
              fontWeight: AppFontWeight.regular,
              color: AppColors.black,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: AppSizes.primary, right: AppSizes.primary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                child: Text(
                  5000.currencyFormatRp,
                  style: const TextStyle(
                    fontSize: AppSizes.primary,
                    fontWeight: AppFontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
              ),
              Container(
                height: 44.0,
                width: 51.0,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary300, width: 1.0),
                    borderRadius: BorderRadius.circular(AppSizes.primary)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: const Text(
                        '5',
                        style: TextStyle(
                          fontSize: AppSizes.primary,
                          fontWeight: AppFontWeight.medium,
                          color: AppColors.primary400,
                        ),
                      ),
                    ),
                    const ImageIcon(
                      AppIcons.solidUlasan,
                      color: AppColors.primary500,
                      size: 12.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(AppSizes.primary),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Detail Barang',
            style: TextStyle(
              fontSize: AppSizes.primary,
              fontWeight: AppFontWeight.semibold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: AppSizes.primary, right: AppSizes.primary),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Stok Total',
                style: TextStyle(
                  fontSize: AppSizes.primary,
                  fontWeight: AppFontWeight.regular,
                ),
              ),
              Text(
                '599',
                style: TextStyle(
                  fontSize: AppSizes.primary,
                  fontWeight: AppFontWeight.regular,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: AppSizes.primary,
              top: AppSizes.primary,
              right: AppSizes.primary),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kategori',
                style: TextStyle(
                  fontSize: AppSizes.primary,
                  fontWeight: AppFontWeight.regular,
                ),
              ),
              Text(
                'Kantong',
                style: TextStyle(
                    fontSize: AppSizes.primary,
                    fontWeight: AppFontWeight.medium,
                    color: AppColors.primary500),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(AppSizes.primary),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Deskripsi Produk',
            style: TextStyle(
              fontSize: AppSizes.primary,
              fontWeight: AppFontWeight.semibold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: AppSizes.primary, right: AppSizes.primary),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Penggunaan totebag dibandingkan dengan kantong plastik memiliki manfaat lingkungan yang besar. Kita dapat mengurangi penggunaan plastik sekali pakai yang sulit diurai oleh alam dan berdampak negatif pada lingkungan kita. Totebag terbuat dari bahan yang kuat dan tahan lama, sehingga dapat digunakan berulang kali. Totebag juga memiliki kapasitas yang lebih besar daripada kantong plastik. Totebag putih ini memiliki desain yang trendy dan stylish, sehingga dapat menjadi aksesori fashion yang menarik perhatian. Warna putih yang simpel membuatnya mudah dipadukan dengan pakaian apa pun. Dapatkan sekarang!',
            style: TextStyle(
              fontSize: AppSizes.primary,
              fontWeight: AppFontWeight.regular,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(AppSizes.primary),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Ulasan',
                style: TextStyle(
                  fontSize: AppSizes.primary,
                  fontWeight: AppFontWeight.semibold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Lihat Semua',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: AppFontWeight.semibold,
                      color: AppColors.primary500),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: AppSizes.primary, bottom: AppSizes.primary),
          child: Row(
            children: [
              const ImageIcon(
                AppIcons.solidUlasan,
                color: AppColors.warning500,
                size: 14.24,
              ),
              Container(
                padding: const EdgeInsets.only(left: 4.0),
                child: const Text(
                  '5',
                  style: TextStyle(
                      fontSize: AppSizes.primary,
                      fontWeight: AppFontWeight.semibold,
                      color: AppColors.black),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 8.0, top: 2.0, bottom: 2.0),
                child: const Text(
                  '599 penilaian',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: AppFontWeight.medium,
                      color: AppColors.grey700),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: AppSizes.primary),
          child: Row(
            children: [
              const SizedBox(
                width: 30.0,
                height: 40.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage(AppImages.cardInfo4),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: const Text(
                  'Muhammad Nabil',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: AppFontWeight.medium,
                      color: AppColors.black),
                ),
              ),
            ],
          ),
        ),
        Container(
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
        ),
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
  }
}
