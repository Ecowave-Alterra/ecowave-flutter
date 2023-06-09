import 'package:ecowave/core.dart';
import 'package:ecowave/features/address/view/pages/add_adress_page.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
import 'package:ecowave/features/payment/bloc/shipping_address/shipping_address_bloc.dart';
import 'package:ecowave/features/payment/model/models/shipping_address_model.dart';
import 'package:ecowave/features/payment/view/widgets/shipping_address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressPage extends StatelessWidget {
  final ShippingAddressModel? currentAddress;

  const ShippingAddressPage({
    super.key,
    required this.currentAddress,
  });

  @override
  Widget build(BuildContext context) {
    ShippingAddressModel? selectedOption = currentAddress;
    final ValueNotifier<bool> isExist =
        ValueNotifier<bool>(selectedOption == null ? false : true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Alamat Pengiriman"),
        actions: [
          IconButton(
            onPressed: () => context.push(const AddressAddPage()),
            icon: const ImageIcon(
              AppIcons.add,
              size: 14.0,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          BlocBuilder<ShippingAddressBloc, ShippingAddressState>(
            builder: (context, state) {
              if (state is ShippingAddressLoading) {
                return const EcoLoading();
              } else if (state is ShippingAddressFailed) {
                return EcoError(
                  errorMessage: state.meesage,
                  onRetry: () => context
                      .read<ShippingAddressBloc>()
                      .add(GetShippingAddressesEvent()),
                );
              } else if (state is ShippingAddressSuccess) {
                if (state.data.isEmpty) {
                  return SizedBox(
                    height: context.fullHeight / 1.4,
                    child: EcoEmpty(
                      massage: "Kamu belum menambahkan alamat",
                      image: AppImages.emptyState,
                      height: context.fullWidth / 2,
                    ),
                  );
                } else {
                  return StatefulBuilder(
                    builder: (context, changeState) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.data.length,
                        itemBuilder: (context, index) => ShippingAddressCard(
                          selectedOption: selectedOption?.id,
                          addressModel: state.data[index],
                          onTap: () {
                            selectedOption = state.data[index];
                            isExist.value = true;
                            changeState(() {});
                          },
                        ),
                      );
                    },
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
        child: ValueListenableBuilder(
          valueListenable: isExist,
          builder: (context, value, _) => EcoFormButton(
            height: 45.0,
            label: "Konfirmasi",
            onPressed: value
                ? () {
                    context
                        .read<PaymentDetailBloc>()
                        .add(ChangeShippingAddressEvent(
                          shippingAddressModel: selectedOption!,
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
