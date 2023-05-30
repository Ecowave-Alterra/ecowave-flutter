import 'package:ecowave/core.dart';
import 'package:ecowave/features/address/view/pages/add_adress_page.dart';
import 'package:ecowave/features/payment/bloc/address/address_bloc.dart';
import 'package:ecowave/features/payment/model/entity/address_entity.dart';
import 'package:ecowave/features/payment/view/widgets/shipping_address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressPage extends StatelessWidget {
  final AddressEntity currentAddress;

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
          BlocBuilder<AddressBloc, AddressState>(
            builder: (context, state) {
              if (state is AddressLoading) {
                return const EcoLoading();
              } else if (state is AddressFailed) {
                return EcoError(
                  errorMessage: state.meesage,
                  onRetry: () {},
                );
              } else if (state is AddressSuccess) {
                return StatefulBuilder(
                  builder: (context, changeState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.data
                          .map(
                            (paymentMethod) => ShippingAddressCard(
                              selectedOption: selectedOption,
                              addressEntity: paymentMethod,
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
