import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/entity/voucher_entity.dart';
import 'package:ecowave/features/payment/view/widgets/voucher_card.dart';
import 'package:flutter/material.dart';

class VoucherPage extends StatelessWidget {
  final VoucherEntity? currentVoucher;

  const VoucherPage({
    super.key,
    required this.currentVoucher,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedOption = currentVoucher?.name;
    final List<VoucherEntity> vouchers = [
      VoucherEntity(
        name: "Gratis Ongkir",
        discount: -10000,
        expiredDate: DateTime(2023, 6, 30),
        imageUrl:
            "https://github.com/Ecowave-Alterra/ecowave-flutter/assets/74108522/bbbd7877-fc15-47ba-94fe-274f7a4954fd",
        termCondition: "Min. Blj Rp 0",
        type: "Amount",
      ),
      VoucherEntity(
        name: "Diskon 30%",
        discount: 20,
        expiredDate: DateTime(2023, 6, 30),
        imageUrl:
            "https://github.com/Ecowave-Alterra/ecowave-flutter/assets/74108522/bbbd7877-fc15-47ba-94fe-274f7a4954fd",
        termCondition: "Min. Blj Rp 100RB s/d 150RB",
        type: "Percent",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Voucher"),
      ),
      body: ListView(
        children: [
          AppSizes.primary.height,
          StatefulBuilder(
            builder: (context, changeState) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: vouchers
                  .map(
                    (element) => VoucherCard(
                      selectedOption: selectedOption,
                      voucherEntity: element,
                      onTap: () {
                        selectedOption = element.name;
                        changeState(() {});
                      },
                      onTermAndConditionTap: () {},
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.primary),
        child: EcoFormButton(
          height: 45.0,
          label: "Gunakan",
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}
