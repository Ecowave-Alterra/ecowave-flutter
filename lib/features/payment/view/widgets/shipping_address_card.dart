import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/entity/address_entity.dart';
import 'package:flutter/material.dart';

class ShippingAddressCard extends StatelessWidget {
  final String? selectedOption;
  final AddressEntity addressEntity;
  final VoidCallback onTap;

  const ShippingAddressCard({
    super.key,
    required this.selectedOption,
    required this.addressEntity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
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
                      value: addressEntity.address,
                      groupValue: selectedOption,
                      onChanged: (value) {},
                      activeColor: AppColors.primary500,
                    ),
                    SizedBox(
                      width: context.fullWidth - 142.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          12.0.height,
                          Text(
                            "${addressEntity.name} (${addressEntity.markedAs})",
                            style: const TextStyle(
                              fontWeight: AppFontWeight.semibold,
                            ),
                          ),
                          6.0.height,
                          Text(addressEntity.phoneNumber),
                          Text(addressEntity.address),
                          6.0.height,
                          if (addressEntity.isMain)
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
      ],
    );
  }
}