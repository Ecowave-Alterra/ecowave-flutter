import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/bloc/voucher/voucher_bloc.dart';
import 'package:ecowave/features/payment/model/entity/voucher_entity.dart';
import 'package:ecowave/features/payment/view/pages/term_and_condition_page.dart';
import 'package:ecowave/features/payment/view/widgets/voucher_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoucherPage extends StatelessWidget {
  final VoucherEntity? currentVoucher;

  const VoucherPage({
    super.key,
    required this.currentVoucher,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedOption = currentVoucher?.name;

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
                return const EcoLoading();
              } else if (state is VoucherFailed) {
                return EcoError(
                  errorMessage: state.meesage,
                  onRetry: () {},
                );
              } else if (state is VoucherSuccess) {
                return StatefulBuilder(
                  builder: (context, changeState) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.data
                        .map(
                          (element) => VoucherCard(
                            selectedOption: selectedOption,
                            voucherEntity: element,
                            onTap: () {
                              selectedOption = element.name;
                              changeState(() {});
                            },
                            onTermAndConditionTap: () => context.push(
                              TermAndConditionPage(
                                voucherEntity: element,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
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
          label: "Gunakan",
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}
