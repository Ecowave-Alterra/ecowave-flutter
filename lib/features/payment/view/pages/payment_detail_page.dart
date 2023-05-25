import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/entity/address_entity.dart';
import 'package:ecowave/features/payment/model/entity/payment_info.dart';
import 'package:ecowave/features/payment/model/entity/voucher.dart';
import 'package:ecowave/features/payment/view/pages/payment_method_page.dart';
import 'package:ecowave/features/payment/view/pages/payment_page.dart';
import 'package:ecowave/features/payment/view/pages/payment_waiting_page.dart';
import 'package:ecowave/features/payment/view/pages/shipping_address_page.dart';
import 'package:ecowave/features/payment/view/pages/shipping_options_page.dart';
import 'package:ecowave/features/payment/view/widgets/address_info_widget.dart';
import 'package:ecowave/features/payment/view/widgets/checkout_setting_button.dart';
import 'package:ecowave/features/payment/view/widgets/checkout_setting_switch.dart';
import 'package:ecowave/features/payment/view/widgets/payment_info_widget.dart';
import 'package:ecowave/features/payment/view/widgets/selected_product_card.dart';
import 'package:flutter/material.dart';

class PaymentDetailPage extends StatelessWidget {
  const PaymentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressEntity currentAddress = AddressEntity(
      name: "Fauzan Abdillah",
      phoneNumber: "082338453444",
      address: "Jl. Imam Sukari No. 85 Mangli Jember",
      markedAs: "Rumah",
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pembayaran"),
      ),
      body: ListView(
        children: [
          AddressInfoWidget(
            addressEntity: currentAddress,
            onChangeTap: () => context.push(ShippingAddressPage(
              currentAddress: currentAddress,
            )),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(AppSizes.primary),
            child: Column(
              children:
                  [1, 2, 3].map((e) => const SelectedProductCard()).toList(),
            ),
          ),
          CheckoutSettingButton(
            value: "JNE",
            label: "Pilih Opsi Pengiriman",
            onPressed: () =>
                context.push(const ShippingOptionsPage(shipping: "JNE")),
          ),
          16.0.height,
          CheckoutSettingButton(
            value: "Gratis Ongkir",
            label: "Gunakan Voucher",
            onPressed: () {},
          ),
          16.0.height,
          CheckoutSettingSwitch(
            label: "Tukarkan Point",
            onChanged: (value) {},
          ),
          16.0.height,
          CheckoutSettingButton(
            label: "Pilih Metode Pembayaran",
            onPressed: () => context.push(const PaymentMethodPage(
              currentPaymentMethod: null,
            )),
          ),
          16.0.height,
          PaymentInfoWidget(
            paymentInfo: PaymentInfo(
              productPrice: 89000,
              shippingPrice: 10000,
              pointUsed: 0,
              voucher: Voucher(
                name: "Gratis Ongkir",
                discount: -10000,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.primary),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Total Pembayaran"),
                  5.0.height,
                  Text(
                    89000.currencyFormatRp,
                    style: const TextStyle(
                      fontWeight: AppFontWeight.semibold,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: EcoFormButton(
                label: "Order Sekarang",
                onPressed: () async {
                  await context.push(const PaymentPage());
                  if (context.mounted) {
                    await context.pushAndRemoveUntil(
                        const PaymentWaitingPage(), (route) => route.isFirst);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
