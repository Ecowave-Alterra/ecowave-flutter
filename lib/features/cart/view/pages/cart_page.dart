import 'package:ecowave/features/cart/model/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core.dart';
import '../../bloc/cart/cart_bloc.dart';
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
    context.read<CartBloc>().add(GetItemCart());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Keranjang',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                  child: OutlinedButton(
                    onPressed: () =>
                        context.read<CartBloc>().add(DeleteAllItemCart()),
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
            const Divider(),
            BlocBuilder<CartBloc, List<CartModel>>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(left: 14, top: 32),
                    itemCount: state.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListItem(
                        id: state[index].id,
                        item: state[index].nameItems,
                        detail: state[index].detailItems,
                        price: state[index].price,
                        image: state[index].image,
                        onPressed: () => context
                            .read<CartBloc>()
                            .add(DeleteItemCart(id: state[index].id)),
                        totalItems: state[index].totalItems,
                        checkedItems: state[index].checkedItems,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 48,
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
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
