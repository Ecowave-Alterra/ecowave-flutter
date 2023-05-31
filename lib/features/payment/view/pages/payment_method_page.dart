import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/bloc/bloc/payment_method_bloc.dart';
import 'package:ecowave/features/payment/model/entity/payment_method_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodPage extends StatelessWidget {
  final String? currentPaymentMethod;

  const PaymentMethodPage({
    super.key,
    required this.currentPaymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedOption = currentPaymentMethod;

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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.ewallets
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.bankTransfers
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
            );
          } else {
            return Container();
          }
        },
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
