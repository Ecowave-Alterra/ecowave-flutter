import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/model/entity/address_entity.dart';
import 'package:ecowave/features/payment/view/widgets/shipping_address_card.dart';
import 'package:flutter/material.dart';

class ShippingAddressPage extends StatelessWidget {
  final AddressEntity currentAddress;

  const ShippingAddressPage({
    super.key,
    required this.currentAddress,
  });

  @override
  Widget build(BuildContext context) {
    String? selectedOption = currentAddress.address;
    final List<AddressEntity> addresses = [
      AddressEntity(
        name: "Hafiizh Taufiqul Hakim",
        phoneNumber: "087725363828",
        address: "Jln Anggrek,No 3 rt 4 rw 5, Jakarta Selatan",
        markedAs: "Rumah",
        isMain: true,
      ),
      AddressEntity(
        name: "Astri shintia nabila",
        phoneNumber: "082345873689",
        address:
            "Jl. Letjen R. Suprapto Gg. Intan No. 2 Galur, Jakarta Pusat, DKI Jakarta 10530",
        markedAs: "Kantor",
      ),
      AddressEntity(
        name: "Fauzan Abdillah",
        phoneNumber: "082338453444",
        address: "Jl. Imam Sukari No. 85 Mangli Jember",
        markedAs: "Rumah",
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Alamat Pengiriman"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AppIcons.add,
              size: 14.0,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSizes.primary),
        children: [
          StatefulBuilder(
            builder: (context, changeState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: addresses
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
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.primary),
        child: EcoFormButton(
          height: 45.0,
          label: "Konfirmasi",
          onPressed: () {},
        ),
      ),
    );
  }
}
