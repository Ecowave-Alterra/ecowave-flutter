import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/bloc/expedition/expedition_bloc.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
import 'package:ecowave/features/payment/model/models/expedition_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingOptionsPage extends StatelessWidget {
  final ExpeditionModel? shipping;

  const ShippingOptionsPage({
    super.key,
    required this.shipping,
  });

  @override
  Widget build(BuildContext context) {
    ExpeditionModel? selectedOption = shipping;
    final ValueNotifier<bool> isExist =
        ValueNotifier<bool>(selectedOption == null ? false : true);

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
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final ExpeditionModel shipping = state.data[index];
                        return InkWell(
                          onTap: () {
                            selectedOption = shipping;
                            isExist.value = true;
                            changeState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.primary,
                                vertical: AppSizes.primary / 2),
                            child: Row(
                              children: [
                                Radio(
                                  value: shipping.id,
                                  groupValue: selectedOption?.id,
                                  onChanged: (value) {
                                    selectedOption = shipping;
                                    isExist.value = true;
                                    changeState(() {});
                                  },
                                  activeColor: AppColors.primary500,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      shipping.name,
                                      style: const TextStyle(
                                        fontWeight: AppFontWeight.semibold,
                                      ),
                                    ),
                                    Text(
                                      shipping.estimateFormat,
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
                        );
                      },
                    );
                  },
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
        child: ValueListenableBuilder<bool>(
          valueListenable: isExist,
          builder: (context, value, _) => EcoFormButton(
            height: 45.0,
            label: "Konfirmasi",
            onPressed: value
                ? () {
                    context.read<PaymentDetailBloc>().add(ChangeExpeditionEvent(
                          expeditionModel: selectedOption!,
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
