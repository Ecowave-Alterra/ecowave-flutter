import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/entity/address_entity.dart';
import 'package:flutter/material.dart';

class AddressInfoWidget extends StatelessWidget {
  final AddressEntity addressEntity;
  final VoidCallback onChangeTap;

  const AddressInfoWidget({
    super.key,
    required this.addressEntity,
    required this.onChangeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.primary),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Alamat Pengiriman",
                style: TextStyle(
                  fontWeight: AppFontWeight.semibold,
                ),
              ),
              12.0.height,
              Text("${addressEntity.name} (${addressEntity.markedAs})"),
              Text(addressEntity.phoneNumber),
              Text(addressEntity.address),
            ],
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary500,
              side: const BorderSide(
                color: AppColors.primary500,
              ),
            ),
            onPressed: onChangeTap,
            child: const Text("Ganti"),
          ),
        ],
      ),
    );
  }
}
