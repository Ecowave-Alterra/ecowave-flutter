import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/models/shipping_address_model.dart';
import 'package:flutter/material.dart';

class AddressInfoWidget extends StatelessWidget {
  final ShippingAddressModel? addressModel;
  final VoidCallback onChangeTap;

  const AddressInfoWidget({
    super.key,
    required this.addressModel,
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
              if (addressModel == null) const Text("-"),
              if (addressModel != null)
                Text("${addressModel!.recipient} (${addressModel!.mark})"),
              if (addressModel != null) Text(addressModel!.phone),
              if (addressModel != null) Text(addressModel!.address),
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
