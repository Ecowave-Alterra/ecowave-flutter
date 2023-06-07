import 'package:ecowave/features/cart/model/entity/cart_model.dart';
import 'package:ecowave/features/cart/model/service/cart_storage.dart';
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
  final List<CartModel> data = [
    CartModel(
      id: '1',
      nameItems: 'Botol',
      detailItems: 'Perabot',
      price: '50000',
      totalItems: 0,
      image: AppImages.productShop1,
      checkedItems: false,
    ),
    CartModel(
      id: '2',
      nameItems: 'ToteBag',
      detailItems: 'Kantong',
      price: '39000',
      totalItems: 0,
      image: AppImages.productShop2,
      checkedItems: false,
    ),
    CartModel(
      id: '3',
      nameItems: 'ToteBag',
      detailItems: 'Kantong',
      price: '40000',
      totalItems: 0,
      image: AppImages.productShop7,
      checkedItems: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    for (CartModel item in data) {
      context.read<CartBloc>().add(
            AddItemCart(
              cartModel: CartModel(
                  id: item.id,
                  nameItems: item.nameItems,
                  detailItems: item.detailItems,
                  image: item.image,
                  price: item.price,
                  totalItems: item.totalItems,
                  checkedItems: item.checkedItems),
            ),
          );
    }
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
