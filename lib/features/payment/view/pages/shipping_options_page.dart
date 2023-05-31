import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingOptionsPage extends StatelessWidget {
  final String? shipping;

  const ShippingOptionsPage({
    super.key,
    required this.shipping,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedOption = shipping;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Opsi Pengiriman"),
      ),
      body: ListView(
        children: [
          BlocBuilder<ExpeditionBloc, ExpeditionState>(
            builder: (context, state) {
              if (state is ExpeditionLoading) {
                return const EcoLoading();
              } else if (state is ExpeditionFailed) {
                return EcoError(
                  errorMessage: state.meesage,
                  onRetry: () {},
                );
              } else if (state is ExpeditionSuccess) {
                return StatefulBuilder(
                  builder: (context, changeState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.data
                          .map(
                            (shipping) => InkWell(
                              onTap: () {
                                selectedOption = shipping.name;
                                changeState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSizes.primary,
                                    vertical: AppSizes.primary / 2),
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
                                            fontWeight: AppFontWeight.semibold,
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
                                    const Spacer(),
                                    Text(shipping.price.currencyFormatRp),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                );
              } else {
                return Container();
              }
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
