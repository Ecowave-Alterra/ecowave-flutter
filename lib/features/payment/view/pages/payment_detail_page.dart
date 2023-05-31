import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/bloc/address/address_bloc.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/payment/model/entity/payment_info.dart';
import 'package:ecowave/features/payment/model/entity/voucher_entity.dart';
import 'package:ecowave/features/payment/view/pages/payment_page.dart';
import 'package:ecowave/features/payment/view/pages/payment_waiting_page.dart';
import 'package:ecowave/features/payment/view/pages/voucher_page.dart';
import 'package:ecowave/features/payment/view/pages/payment_method_page.dart';
import 'package:ecowave/features/payment/view/pages/shipping_address_page.dart';
import 'package:ecowave/features/payment/view/pages/shipping_options_page.dart';
import 'package:ecowave/features/payment/view/widgets/address_info_widget.dart';
import 'package:ecowave/features/payment/view/widgets/checkout_setting_button.dart';
import 'package:ecowave/features/payment/view/widgets/checkout_setting_switch.dart';
import 'package:ecowave/features/payment/view/widgets/payment_info_widget.dart';
import 'package:ecowave/features/payment/view/widgets/selected_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentDetailPage extends StatelessWidget {
  const PaymentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AddressBloc>().add(GetAddressesEvent());
    context.read<ExpeditionBloc>().add(GetExpeditionsEvent());

    final VoucherEntity selectedVoucher = VoucherEntity(
      name: "Gratis Ongkir",
      discount: -10000,
      expiredDate: DateTime(2023, 10, 15),
      imageUrl:
          "https://github.com/Ecowave-Alterra/ecowave-flutter/assets/74108522/bbbd7877-fc15-47ba-94fe-274f7a4954fd",
      termCondition: "Min. Blj Rp 0",
      type: "Amount",
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pembayaran"),
      ),
      body: ListView(
        children: [
          BlocBuilder<AddressBloc, AddressState>(
            builder: (context, state) {
              if (state is AddressLoading) {
                return const EcoLoading();
              } else if (state is AddressFailed) {
                return EcoError(
                  errorMessage: state.meesage,
                  onRetry: () {},
                );
              } else if (state is AddressSuccess) {
                return AddressInfoWidget(
                  addressEntity:
                      state.data.where((element) => element.isPrimary).first,
                  onChangeTap: () => context.push(ShippingAddressPage(
                    currentAddress:
                        state.data.where((element) => element.isPrimary).first,
                  )),
                );
              } else {
                return Container();
              }
            },
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
            value: null,
            label: "Pilih Opsi Pengiriman",
            onPressed: () =>
                context.push(const ShippingOptionsPage(shipping: null)),
          ),
          16.0.height,
          CheckoutSettingButton(
            value: "Gratis Ongkir",
            label: "Gunakan Voucher",
            onPressed: () => context.push(VoucherPage(
              currentVoucher: selectedVoucher,
            )),
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
              voucher: selectedVoucher,
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
