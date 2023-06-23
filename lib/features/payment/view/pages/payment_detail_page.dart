import 'package:ecowave/core.dart';
import 'package:ecowave/features/address/bloc/address/address_bloc.dart';
import 'package:ecowave/features/cart/bloc/cart/cart_bloc.dart';
import 'package:ecowave/features/cart/model/models/cart_model.dart';
import 'package:ecowave/features/home/bloc/home/home_bloc.dart';
import 'package:ecowave/features/payment/bloc/get_point/get_point_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
import 'package:ecowave/features/payment/bloc/voucher/voucher_bloc.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/address/model/models/address_model.dart';
import 'package:ecowave/features/payment/model/models/expedition_request.dart';
import 'package:ecowave/features/payment/model/models/transaction_request.dart';
import 'package:ecowave/features/payment/view/pages/payment_page.dart';
import 'package:ecowave/features/payment/view/pages/payment_waiting_page.dart';
import 'package:ecowave/features/payment/view/pages/voucher_page.dart';
import 'package:ecowave/features/payment/view/pages/shipping_address_page.dart';
import 'package:ecowave/features/payment/view/pages/shipping_options_page.dart';
import 'package:ecowave/features/payment/view/widgets/address_info_widget.dart';
import 'package:ecowave/features/payment/view/widgets/checkout_setting_button.dart';
import 'package:ecowave/features/payment/view/widgets/checkout_setting_switch.dart';
import 'package:ecowave/features/payment/view/widgets/payment_info_widget.dart';
import 'package:ecowave/features/payment/view/widgets/selected_product_card.dart';
import 'package:ecowave/features/profile/view/empty_session_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentDetailPage extends StatelessWidget {
  final List<CartModel> carts;

  const PaymentDetailPage({
    super.key,
    required this.carts,
  });

  @override
  Widget build(BuildContext context) {
    context.read<PaymentDetailBloc>().add(const PointUsedEvent(pointUsed: 0));
    context.read<PaymentDetailBloc>().add(GetCartsEvent(carts: carts));
    context.read<GetPointBloc>().add(0);
    context.read<VoucherBloc>().add(GetVouchersEvent());
    context.read<AddressBloc>().add(GetAddressesEvent());

    int totalPayment = 0;

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.token == ''){
          return const EmptyUserPage();
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Detail Pembayaran"),
          ),
          body: ListView(
            children: [
              BlocBuilder<PaymentDetailBloc, PaymentDetailState>(
                builder: (context, state) {
                  if (state.addressModel != null) {
                    return AddressInfoWidget(
                      addressModel: state.addressModel,
                      onChangeTap: () => context.push(ShippingAddressPage(
                        currentAddress: state.addressModel,
                      )),
                    );
                  } else {
                    return BlocBuilder<AddressBloc, AddressState>(
                      builder: (context, state) {
                        if (state is AddressLoading) {
                          return const EcoLoading();
                        } else if (state is AddressFailed) {
                          return EcoError(
                            errorMessage: state.meesage,
                            onRetry: () => context
                                .read<AddressBloc>()
                                .add(GetAddressesEvent()),
                          );
                        } else if (state is AddressSuccess) {
                          final AddressModel shippingAddressModel = state
                              .addresses!
                              .where((element) => element.isPrimary)
                              .first;

                          context
                              .read<PaymentDetailBloc>()
                              .add(ChangeShippingAddressEvent(
                                addressModel: shippingAddressModel,
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
                  children: carts
                      .map((e) => SelectedProductCard(cartModel: e))
                      .toList(),
                ),
              ),
              BlocBuilder<PaymentDetailBloc, PaymentDetailState>(
                builder: (context, state) {
                  return CheckoutSettingButton(
                    value: state.expeditionModel?.name,
                    label: "Pilih Opsi Pengiriman",
                    icon: AppIcons.shipping,
                    onPressed: () {
                      context.read<ExpeditionBloc>().add(GetExpeditionsEvent(
                            request: ExpeditionRequest(
                              cityId: state.addressModel!.cityId.toString(),
                              weight: 1,
                            ),
                          ));
                      context.push(ShippingOptionsPage(
                        cityId: state.addressModel!.cityId.toString(),
                        shipping: state.expeditionModel,
                      ));
                    },
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
                      productPrice: state.paymentInfo?.productPrice ?? 0,
                      currentVoucher: state.voucherModel,
                    )),
                  );
                },
              ),
              16.0.height,
              BlocBuilder<GetPointBloc, int>(
                builder: (context, state) {
                  return CheckoutSettingSwitch(
                    currentPoint: state,
                    label: "Tukarkan Point",
                    onChanged: (value) => context
                        .read<PaymentDetailBloc>()
                        .add(PointUsedEvent(pointUsed: value)),
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
                            (state.paymentInfo?.totalPayment ?? 0)
                                .currencyFormatRp,
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
                  child: BlocConsumer<PaymentDetailBloc, PaymentDetailState>(
                    listener: (context, state) async {
                      if (state.transactionModel != null) {
                        await context.push(PaymentPage(
                          paymentId: state.transactionModel!.transactionId,
                          paymentUrl: state.transactionModel!.paymentUrl,
                        ));
                        if (context.mounted) {
                          context.pushAndRemoveUntil(
                              PaymentWaitingPage(totalPayment: totalPayment),
                              (route) => route.isFirst);
                        }
                      }
                    },
                    builder: (context, state) {
                      return EcoFormButton(
                        label: "Order Sekarang",
                        onPressed: state.addressModel == null ||
                                state.expeditionModel == null ||
                                state.carts == null
                            ? null
                            : () async {
                                totalPayment = state.paymentInfo!.totalPayment;
                                context
                                    .read<PaymentDetailBloc>()
                                    .add(CheckoutEvent(
                                      request: TransactionRequest(
                                        addressId: state.addressModel!.id,
                                        totalShippingPrice:
                                            state.paymentInfo!.totalPayment,
                                        expeditionName:
                                            state.expeditionModel!.name,
                                        estimationDay:
                                            state.expeditionModel!.etd,
                                        discount: state.paymentInfo!.discount,
                                        transactionDetails: carts
                                            .map((e) => TransactionDetail(
                                                  productId: e.id,
                                                  productName: e.nameItems,
                                                  qty: e.totalItems,
                                                  subTotalPrice: e.totalPrice,
                                                ))
                                            .toList(),
                                        point: state.pointUsed,
                                        voucherId: state.voucherModel?.id,
                                      ),
                                    ));
                                for (CartModel element in carts) {
                                  context
                                      .read<CartBloc>()
                                      .add(DeleteItemCart(id: element.id));
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
      },
    );
  }
}
