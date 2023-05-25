import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

class EmptyCartPage extends StatefulWidget {
  const EmptyCartPage({super.key});

  @override
  State<EmptyCartPage> createState() => _EmptyCartPageState();
}

class _EmptyCartPageState extends State<EmptyCartPage> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keranjang',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: const Text(
                      "Pilih Semua Barang",
                      style: TextStyle(fontWeight: AppFontWeight.semibold),
                    ),
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = newValue!;
                      });
                    },
                    activeColor: AppColors.primary500,
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                SizedBox(
                  width: 95,
                  height: 32,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      'Hapus',
                      style: TextStyle(
                        color: AppColors.primary500,
                        fontWeight: AppFontWeight.semibold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          const Expanded(
            child: Align(
              alignment: Alignment.center,
              child: EcoEmpty(
                massage: 'Tidak ada Produk',
                image: AppImages.emptyKeranjang,
                height: 162,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.primary),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Pembayaran'),
                  Text(
                    'Rp. -',
                    style: TextStyle(fontWeight: AppFontWeight.semibold),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: EcoFormButton(
                label: 'Beli',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
