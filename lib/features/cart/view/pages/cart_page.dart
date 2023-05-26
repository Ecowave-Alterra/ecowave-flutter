import 'package:flutter/material.dart';

import '../../../../core.dart';
import '../widgets/list_item_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool checkedAll = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keranjang',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    value: checkedAll,
                    onChanged: (newValue) {
                      setState(() {
                        checkedAll = newValue!;
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
          Padding(
            padding: const EdgeInsets.only(
              left: 14,
              top: 20,
            ),
            child: Column(
              children: [
                const ListItem(
                  price: '50.000',
                  image: AppImages.productShop2,
                ),
                48.0.height,
                const ListItem(
                  price: '39.000',
                  image: AppImages.productShop1,
                ),
              ],
            ),
          )
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
                    'Rp. 50.000',
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
