import 'package:ecowave/core.dart';
import 'package:ecowave/features/address/bloc/address/address_bloc.dart';
import 'package:ecowave/features/address/view/pages/add_address_page.dart';
import 'package:ecowave/features/payment/bloc/payment_detail/payment_detail_bloc.dart';
import 'package:ecowave/features/address/model/models/address_model.dart';
import 'package:ecowave/features/payment/view/widgets/shipping_address_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddressPage extends StatelessWidget {
  final AddressModel? currentAddress;

  const ShippingAddressPage({
    super.key,
    required this.currentAddress,
  });

  @override
  Widget build(BuildContext context) {
    AddressModel? selectedOption = currentAddress;
    final ValueNotifier<bool> isExist =
        ValueNotifier<bool>(selectedOption == null ? false : true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Alamat Pengiriman"),
        actions: [
          IconButton(
            onPressed: () => context.push(const AddAddressPage()),
            icon: const ImageIcon(
              AppIcons.add,
              size: 14.0,
            ),
          ),
        ],
      ),
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state is AddressLoading) {
            return const EcoLoading();
          } else if (state is AddressFailed) {
            return EcoError(
              errorMessage: state.meesage,
              onRetry: () =>
                  context.read<AddressBloc>().add(GetAddressesEvent()),
            );
          } else if (state is AddressSuccess) {
            if (state.addresses!.isEmpty) {
              return SizedBox(
                width: context.fullWidth,
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
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.addresses!.length,
                    itemBuilder: (context, index) => ShippingAddressCard(
                      selectedOption: selectedOption?.id,
                      addressModel: state.addresses![index],
                      onTap: () {
                        selectedOption = state.addresses![index];
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
                          addressModel: selectedOption!,
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
