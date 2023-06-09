import 'package:ecowave/core.dart';
import 'package:ecowave/features/address/model/models/address_model.dart';
import 'package:flutter/material.dart';

class ShippingAddressCard extends StatelessWidget {
  final int? selectedOption;
  final AddressModel addressModel;
  final VoidCallback onTap;

  const ShippingAddressCard({
    super.key,
    required this.selectedOption,
    required this.addressModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(right: AppSizes.primary),
        margin: const EdgeInsets.only(bottom: AppSizes.primary),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: context.fullWidth - 94.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Radio(
                    value: addressModel.userAddress,
                    groupValue: selectedOption,
                    onChanged: (value) => onTap(),
                    activeColor: AppColors.primary500,
                  ),
                  SizedBox(
                    width: context.fullWidth - 142.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        12.0.height,
                        Text(
                          "${addressModel.recipient} (${addressModel.mark})",
                          style: const TextStyle(
                            fontWeight: AppFontWeight.semibold,
                          ),
                        ),
                        6.0.height,
                        Text(addressModel.phoneNumber),
                        Text(addressModel.address),
                        6.0.height,
                        if (addressModel.isPrimary)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: AppColors.primary500,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                "Utama",
                                style: TextStyle(
                                  color: AppColors.primary500,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: EcoFormButton(
                width: 62.0,
                label: "Ubah",
                onPressed: () {},
                backgroundColor: Colors.transparent,
                border: Border.all(
                  color: AppColors.primary500,
                ),
                textColor: AppColors.primary500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
