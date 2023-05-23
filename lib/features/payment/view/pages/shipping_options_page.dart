import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/entity/shipping.dart';
import 'package:flutter/material.dart';

class ShippingOptionsPage extends StatelessWidget {
  final String shipping;

  const ShippingOptionsPage({
    super.key,
    required this.shipping,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedOption = shipping;
    final List<Shipping> shippings = [
      Shipping(
        name: "JNE",
        estimateFrom: DateTime(2023, 5, 1),
        estimateComing: DateTime(2023, 5, 8),
        price: 10000,
      ),
      Shipping(
        name: "JNT",
        estimateFrom: DateTime(2023, 5, 1),
        estimateComing: DateTime(2023, 5, 5),
        price: 12000,
      ),
      Shipping(
        name: "SiCepat",
        estimateFrom: DateTime(2023, 5, 1),
        estimateComing: DateTime(2023, 5, 3),
        price: 16000,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Opsi Pengiriman"),
      ),
      body: ListView(
        children: [
          StatefulBuilder(
            builder: (context, changeState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: shippings
                    .map(
                      (shipping) => Row(
                        children: [
                          InkWell(
                            onTap: () {
                              selectedOption = shipping.name;
                              changeState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.primary,
                                  vertical: AppSizes.primary / 2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: context.fullWidth - 87.0,
                                    child: Row(
                                      children: [
                                        Radio(
                                          value: shipping.name,
                                          groupValue: selectedOption,
                                          onChanged: (value) {},
                                          activeColor: AppColors.primary500,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              shipping.name,
                                              style: const TextStyle(
                                                fontWeight:
                                                    AppFontWeight.semibold,
                                              ),
                                            ),
                                            Text(
                                              shipping.estimate,
                                              style: const TextStyle(
                                                color: AppColors.grey500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(shipping.price.currencyFormatRp),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.primary),
        child: EcoFormButton(
          height: 45.0,
          label: "Konfirmasi",
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}
