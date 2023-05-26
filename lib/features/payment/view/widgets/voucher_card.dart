import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/entity/voucher_entity.dart';
import 'package:flutter/material.dart';

class VoucherCard extends StatelessWidget {
  final String? selectedOption;
  final VoucherEntity voucherEntity;
  final VoidCallback onTap;
  final VoidCallback onTermAndConditionTap;

  const VoucherCard({
    super.key,
    required this.selectedOption,
    required this.voucherEntity,
    required this.onTap,
    required this.onTermAndConditionTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: AppSizes.primary, vertical: AppSizes.primary / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: const Border(
            top: BorderSide(width: 0, color: AppColors.black),
            left: BorderSide(width: 0.2, color: AppColors.black),
            right: BorderSide(width: 0.2, color: AppColors.black),
            bottom: BorderSide(width: 0.2, color: AppColors.black),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              voucherEntity.imageUrl,
              width: context.fullWidth,
              height: 120.0,
              fit: BoxFit.cover,
            ),
            16.0.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    voucherEntity.name,
                    style: const TextStyle(
                      fontWeight: AppFontWeight.semibold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    width: 14.0,
                    height: 14.0,
                    child: Radio(
                      value: voucherEntity.name,
                      groupValue: selectedOption,
                      onChanged: (value) {},
                      activeColor: AppColors.primary500,
                    ),
                  ),
                ],
              ),
            ),
            8.0.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
              child: Text(
                voucherEntity.termCondition,
                style: const TextStyle(
                  color: AppColors.grey600,
                ),
              ),
            ),
            8.0.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.primary),
              child: Row(
                children: [
                  const Icon(
                    Icons.alarm,
                    size: 14.0,
                    color: AppColors.grey500,
                  ),
                  6.0.width,
                  Text(
                    "Berlaku sampai ${voucherEntity.expiredDateFormatString}",
                    style: const TextStyle(
                      color: AppColors.primary500,
                      fontSize: 12.0,
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: onTermAndConditionTap,
                    child: const Text(
                      "S&K",
                      style: TextStyle(
                        color: AppColors.primary500,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            16.0.height,
          ],
        ),
      ),
    );
  }
}
