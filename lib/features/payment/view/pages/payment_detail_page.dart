import 'package:ecowave/core.dart';
import 'package:ecowave/core/enums/data_state_status.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
import 'package:ecowave/features/payment/bloc/voucher/voucher_bloc.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/payment/bloc/shipping_address/shipping_address_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_method/payment_method_bloc.dart';
import 'package:ecowave/features/payment/model/models/shipping_address_model.dart';
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
    context.read<PaymentDetailBloc>().add(const PointUsedEvent(pointUsed: 0));
    context.read<VoucherBloc>().add(GetVouchersEvent());
    context.read<ExpeditionBloc>().add(GetExpeditionsEvent());
    context.read<ShippingAddressBloc>().add(GetShippingAddressesEvent());
    context.read<PaymentMethodBloc>().add(GetPaymentMethodsEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pembayaran"),
      ),
      body: ListView(
        children: [
          BlocBuilder<PaymentDetailBloc, PaymentDetailState>(
            builder: (context, state) {
              if (state.shippingAddressModel != null) {
                return AddressInfoWidget(
                  addressModel: state.shippingAddressModel,
                  onChangeTap: () => context.push(ShippingAddressPage(
                    currentAddress: state.shippingAddressModel,
                  )),
                );
              } else {
                return BlocBuilder<ShippingAddressBloc, ShippingAddressState>(
                  builder: (context, state) {
                    if (state is ShippingAddressLoading) {
                      return const EcoLoading();
                    } else if (state is ShippingAddressFailed) {
                      return EcoError(
                        errorMessage: state.meesage,
                        onRetry: () {},
                      );
                    } else if (state is ShippingAddressSuccess) {
                      final ShippingAddressModel shippingAddressModel = state
                          .data
                          .where((element) => element.isPrimary)
                          .first;

                      context
                          .read<PaymentDetailBloc>()
                          .add(ChangeShippingAddressEvent(
                            shippingAddressModel: shippingAddressModel,
                          ));

                      return AddressInfoWidget(
                        addressModel: shippingAddressModel,
                        onChangeTap: () => context.push(ShippingAddressPage(
                          currentAddress: shippingAddressModel,
                        )),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                );
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
          BlocBuilder<PaymentDetailBloc, PaymentDetailState>(
            builder: (context, state) {
              return CheckoutSettingButton(
                value: state.expeditionModel?.name,
                label: "Pilih Opsi Pengiriman",
                icon: AppIcons.shipping,
                onPressed: () => context.push(ShippingOptionsPage(
                  shipping: state.expeditionModel,
                )),
              );
            },
          ),
          16.0.height,
          BlocBuilder<PaymentDetailBloc, PaymentDetailState>(
            builder: (context, state) {
              return CheckoutSettingButton(
                value: state.voucherModel?.name,
                label: "Gunakan Voucher",
                icon: AppIcons.voucher,
                iconColor: AppColors.warning500,
                onPressed: () => context.push(VoucherPage(
                  currentVoucher: state.voucherModel,
                )),
              );
            },
          ),
          16.0.height,
          CheckoutSettingSwitch(
            currentPoint: 9000,
            label: "Tukarkan Point",
            onChanged: (value) => context
                .read<PaymentDetailBloc>()
                .add(PointUsedEvent(pointUsed: value)),
          ),
          16.0.height,
          BlocBuilder<PaymentDetailBloc, PaymentDetailState>(
            builder: (context, state) {
              return CheckoutSettingButton(
                value: state.paymentMethodModel?.name,
                label: "Pilih Metode Pembayaran",
                icon: AppIcons.payment,
                onPressed: () => context.push(PaymentMethodPage(
                  currentPaymentMethod: state.paymentMethodModel,
                )),
              );
            },
          ),
          16.0.height,
          BlocBuilder<PaymentDetailBloc, PaymentDetailState>(
            builder: (context, state) {
              if (state.status == DataStateStatus.success) {
                return PaymentInfoWidget(
                  paymentInfo: state.paymentInfo!,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
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
                  BlocBuilder<PaymentDetailBloc, PaymentDetailState>(
                    builder: (context, state) {
                      return Text(
                        (state.paymentInfo?.totalPayment ?? 0).currencyFormatRp,
                        style: const TextStyle(
                          fontWeight: AppFontWeight.semibold,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: BlocBuilder<PaymentDetailBloc, PaymentDetailState>(
                builder: (context, state) {
                  return EcoFormButton(
                    label: "Order Sekarang",
                    onPressed: state.shippingAddressModel == null ||
                            state.expeditionModel == null ||
                            state.paymentMethodModel == null
                        ? null
                        : () async {
                            await context.push(const PaymentPage());
                            if (context.mounted) {
                              context.read<PaymentDetailBloc>().add(
                                    CheckoutEvent(
                                      shippingAddressModel:
                                          state.shippingAddressModel!,
                                      paymentMethodModel:
                                          state.paymentMethodModel!,
                                      expeditionModel: state.expeditionModel!,
                                      voucherModel: state.voucherModel,
                                      products: const [],
                                      pointUsed: state.pointUsed,
                                      totalPayment:
                                          state.paymentInfo!.totalPayment,
                                    ),
                                  );

                              await context.pushAndRemoveUntil(
                                  const PaymentWaitingPage(),
                                  (route) => route.isFirst);
                            }
                          },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
