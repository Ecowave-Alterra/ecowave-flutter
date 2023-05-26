import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/entity/payment_method.dart';
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatelessWidget {
  final String? currentPaymentMethod;

  const PaymentMethodPage({
    super.key,
    required this.currentPaymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedOption = currentPaymentMethod;
    final List<PaymentMethod> ewallets = [
      PaymentMethod(
        name: "OVO",
        iconUrl: AppImages.ovo,
        instructions: [],
      ),
      PaymentMethod(
        name: "Gopay",
        iconUrl: AppImages.gopay,
        instructions: [],
      ),
      PaymentMethod(
        name: "Dana",
        iconUrl: AppImages.dana,
        instructions: [],
      ),
      PaymentMethod(
        name: "Shopee pay",
        iconUrl: AppImages.shopeePay,
        instructions: [],
      ),
    ];
    final List<PaymentMethod> bankTransfers = [
      PaymentMethod(
        name: "BCA",
        iconUrl: AppImages.bca,
        instructions: [],
      ),
      PaymentMethod(
        name: "BRI",
        iconUrl: AppImages.bri,
        instructions: [],
      ),
      PaymentMethod(
        name: "BNI",
        iconUrl: AppImages.bni,
        instructions: [],
      ),
      PaymentMethod(
        name: "Mandiri",
        iconUrl: AppImages.mandiri,
        instructions: [],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Metode Pembayaran"),
      ),
      body: StatefulBuilder(
        builder: (context, changeState) => ListView(
          children: [
            AppSizes.primary.height,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.primary),
              child: Text(
                "E-Wallet",
                style: TextStyle(
                  fontWeight: AppFontWeight.semibold,
                ),
              ),
            ),
            AppSizes.primary.height,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.primary),
              child: Divider(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: ewallets
                  .map(
                    (element) => InkWell(
                      onTap: () {
                        selectedOption = element.name;
                        changeState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.primary,
                            vertical: AppSizes.primary),
                        child: Row(
                          children: [
                            Image.asset(
                              element.iconUrl,
                              width: 24.0,
                            ),
                            6.0.width,
                            Text(
                              element.name,
                              style: const TextStyle(
                                fontWeight: AppFontWeight.semibold,
                              ),
                            ),
                            const Spacer(),
                            if (selectedOption == element.name)
                              const Icon(
                                Icons.check,
                                color: AppColors.primary500,
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            30.0.height,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.primary),
              child: Text(
                "Transfer Bank",
                style: TextStyle(
                  fontWeight: AppFontWeight.semibold,
                ),
              ),
            ),
            AppSizes.primary.height,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.primary),
              child: Divider(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: bankTransfers
                  .map(
                    (element) => InkWell(
                      onTap: () {
                        selectedOption = element.name;
                        changeState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.primary,
                            vertical: AppSizes.primary),
                        child: Row(
                          children: [
                            Image.asset(
                              element.iconUrl,
                              width: 24.0,
                            ),
                            6.0.width,
                            Text(
                              element.name,
                              style: const TextStyle(
                                fontWeight: AppFontWeight.semibold,
                              ),
                            ),
                            const Spacer(),
                            if (selectedOption == element.name)
                              const Icon(
                                Icons.check,
                                color: AppColors.primary500,
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
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
