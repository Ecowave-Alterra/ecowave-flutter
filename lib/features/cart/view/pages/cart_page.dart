import 'package:ecowave/features/cart/model/entity/cart_model.dart';
import 'package:ecowave/features/cart/model/service/cart_database.dart';
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
  DatabaseInstance? databaseInstance;
  bool checkedAll = false;
  Future initDatabase() async {
    await databaseInstance!.database();
    setState(() {});
  }

  Future delete(int id) async {
    await databaseInstance!.delete(id);
    setState(() {});
  }

  Future deleteAll() async {
    await databaseInstance!.deleteAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () => deleteAll(),
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
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartInitial) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary500,
                    ),
                  );
                } else if (state is CartSuccess) {
                  return Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.only(left: 14, top: 32),
                      itemCount: state.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListItem(
                          id: state.data![index].id!,
                          item: state.data![index].nameItems!,
                          detail: state.data![index].detailItems!,
                          price: state.data![index].price!,
                          image: state.data![index].image!,
                          onPressed: () => (),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 48,
                        );
                      },
                    ),
                  );
                } else if (state is CartError) {
                  return const Center(
                    child: Text('Data not found!'),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
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
