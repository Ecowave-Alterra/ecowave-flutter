import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_method/payment_method_bloc.dart';
import 'package:ecowave/features/payment/model/models/payment_method_model.dart';
import 'package:ecowave/features/payment/model/models/payment_method_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodPage extends StatelessWidget {
  final PaymentMethodModel? currentPaymentMethod;

  const PaymentMethodPage({
    super.key,
    required this.currentPaymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    PaymentMethodModel? selectedOption = currentPaymentMethod;
    final ValueNotifier<bool> isExist =
        ValueNotifier<bool>(selectedOption == null ? false : true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Metode Pembayaran"),
      ),
      body: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
        builder: (context, state) {
          if (state is PaymentMethodLoading) {
            return const EcoLoading();
          } else if (state is PaymentMethodFailed) {
            return EcoError(
              errorMessage: state.meesage,
              onRetry: () {},
            );
          } else if (state is PaymentMethodSuccess) {
            return StatefulBuilder(
              builder: (context, changeState) => ListView(
                children: [
                  AppSizes.primary.height,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.primary),
                    child: Text(
                      PaymentMethodType.eWallet,
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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.ewallets.length,
                    itemBuilder: (context, index) {
                      final PaymentMethodModel element = state.ewallets[index];
                      return InkWell(
                        onTap: () {
                          selectedOption = element;
                          isExist.value = true;
                          changeState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.primary,
                              vertical: AppSizes.primary),
                          child: Row(
                            children: [
                              Image.network(
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
                              if (selectedOption?.id == element.id)
                                const Icon(
                                  Icons.check,
                                  color: AppColors.primary500,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  30.0.height,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppSizes.primary),
                    child: Text(
                      PaymentMethodType.bankTransfer,
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
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.bankTransfers.length,
                    itemBuilder: (context, index) {
                      final PaymentMethodModel element =
                          state.bankTransfers[index];
                      return InkWell(
                        onTap: () {
                          selectedOption = element;
                          isExist.value = true;
                          changeState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.primary,
                              vertical: AppSizes.primary),
                          child: Row(
                            children: [
                              Image.network(
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
                              if (selectedOption?.id == element.id)
                                const Icon(
                                  Icons.check,
                                  color: AppColors.primary500,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.primary),
        child: ValueListenableBuilder(
          valueListenable: isExist,
          builder: (context, value, _) => EcoFormButton(
            height: 45.0,
            label: "Konfirmasi",
            onPressed: value
                ? () {
                    context
                        .read<PaymentDetailBloc>()
                        .add(ChangePaymentMethodEvent(
                          paymentMethodModel: selectedOption!,
                        ));
                    context.pop();
                  }
                : null,
          ),
        ),
      ),
    );
  }
}
