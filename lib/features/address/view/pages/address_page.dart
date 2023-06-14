import 'package:ecowave/core.dart';
import 'package:ecowave/features/address/bloc/address/address_bloc.dart';
import 'package:ecowave/features/address/view/pages/add_adress_page.dart';
import 'package:ecowave/features/address/view/pages/update_adress_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AddressBloc>().add(GetAddressesEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alamat Saya'),
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
                height: context.fullHeight / 1.3,
                child: EcoEmpty(
                  massage: "Kamu belum menambahkan alamat",
                  image: AppImages.emptyState,
                  height: context.fullWidth / 2,
                ),
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.addresses!.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.addresses![index].recipient} (${state.addresses![index].mark})',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: AppFontWeight.semibold,
                                color: AppColors.black,
                              ),
                            ),
                            6.0.height,
                            Text(
                              state.addresses![index].phoneNumber,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: AppFontWeight.regular,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              state.addresses![index].address,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: AppFontWeight.regular,
                                color: AppColors.black,
                              ),
                            ),
                            6.0.height,
                            if (state.addresses![index].isPrimary)
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: AppColors.primary500),
                                ),
                                child: const Text(
                                  'Utama',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: AppFontWeight.regular,
                                    color: AppColors.primary500,
                                  ),
                                ),
                              )
                          ],
                        ),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: AppColors.primary500),
                          ),
                          child: TextButton(
                            onPressed: () => context.push(UpdateAddressPage(
                              addressModel: state.addresses![index],
                            )),
                            child: const Text(
                              'Ubah',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: AppFontWeight.semibold,
                                color: AppColors.primary500,
                              ),
                            ),
                          ),
                        ),
                      ],
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
    );
  }
}
