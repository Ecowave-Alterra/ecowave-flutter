import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
import 'package:ecowave/features/payment/bloc/voucher/voucher_bloc.dart';
import 'package:ecowave/features/payment/model/models/voucher_model.dart';
import 'package:ecowave/features/payment/view/pages/term_and_condition_page.dart';
import 'package:ecowave/features/payment/view/widgets/voucher_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoucherPage extends StatelessWidget {
  final int productPrice;
  final VoucherModel? currentVoucher;

  const VoucherPage({
    super.key,
    required this.productPrice,
    required this.currentVoucher,
  });

  @override
  Widget build(BuildContext context) {
    VoucherModel? selectedOption = currentVoucher;
    final ValueNotifier<bool> isExist =
        ValueNotifier<bool>(selectedOption == null ? false : true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Voucher"),
      ),
      body: ListView(
        children: [
          AppSizes.primary.height,
          BlocBuilder<VoucherBloc, VoucherState>(
            builder: (context, state) {
              if (state is VoucherLoading) {
                return SizedBox(
                  height: context.fullHeight / 1.3,
                  child: const EcoLoading(),
                );
              } else if (state is VoucherFailed) {
                return SizedBox(
                  height: context.fullHeight / 1.3,
                  child: EcoError(
                    errorMessage: state.meesage,
                    onRetry: () =>
                        context.read<VoucherBloc>().add(GetVouchersEvent()),
                  ),
                );
              } else if (state is VoucherSuccess) {
                if (state.data.isEmpty) {
                  return SizedBox(
                    height: context.fullHeight / 1.4,
                    child: EcoEmpty(
                      massage: "Voucher tidak tersedia",
                      image: AppImages.emptyState,
                      height: context.fullWidth / 2,
                    ),
                  );
                } else {
                  return StatefulBuilder(
                    builder: (context, changeState) => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final VoucherModel element = state.data[index];
                        return VoucherCard(
                          productPrice: productPrice,
                          selectedOption: selectedOption?.id,
                          voucherModel: element,
                          onTap: () {
                            selectedOption = element;
                            isExist.value = true;
                            changeState(() {});
                          },
                          onTermAndConditionTap: () => context.push(
                            TermAndConditionPage(
                              voucherModel: element,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
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
            label: "Gunakan",
            onPressed: value
                ? () {
                    context.read<PaymentDetailBloc>().add(ChangeVoucherEvent(
                          voucherModel: selectedOption!,
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
