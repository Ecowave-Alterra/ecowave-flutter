import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 171,
      height: 230,
      margin: const EdgeInsets.only(left: AppSizes.primary),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey300),
        borderRadius: BorderRadius.circular(AppSizes.radius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radius),
            child: Image.asset(
              AppImages.productShop1,
              height: 120,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                top: AppSizes.primary, left: AppSizes.primary),
            child: const Text(
              'Tempat Minum Reusable',
              style: TextStyle(
                fontWeight: AppFontWeight.regular,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 16),
            child: const Text(
              'Rp.59.000',
              style: TextStyle(
                fontWeight: AppFontWeight.regular,
                fontSize: 12,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 16),
            child: const Row(
              children: [
                ImageIcon(
                  AppIcons.solidUlasan,
                  color: AppColors.warning500,
                  size: 12,
                ),
                Text(
                  '4.5',
                  style: TextStyle(
                    fontWeight: AppFontWeight.medium,
                    color: AppColors.grey700,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
