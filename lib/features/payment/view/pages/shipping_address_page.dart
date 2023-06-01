import 'package:ecowave/core.dart';
import 'package:ecowave/features/address/view/pages/add_adress_page.dart';
import 'package:ecowave/features/payment/bloc/shipping_address/shipping_address_bloc.dart';
import 'package:ecowave/features/payment/model/models/shipping_address_model.dart';
import 'package:ecowave/features/payment/view/widgets/shipping_address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressPage extends StatelessWidget {
  final ShippingAddressModel currentAddress;

  const ShippingAddressPage({
    super.key,
    required this.currentAddress,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedOption = currentAddress.address;

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
                return StatefulBuilder(
                  builder: (context, changeState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.data
                          .map(
                            (paymentMethod) => ShippingAddressCard(
                              selectedOption: selectedOption,
                              addressModel: paymentMethod,
                              onTap: () {
                                selectedOption = paymentMethod.address;
                                changeState(() {});
                              },
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
