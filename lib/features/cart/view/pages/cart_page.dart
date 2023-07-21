import 'package:ecowave/features/home/bloc/home/home_bloc.dart';
import 'package:ecowave/features/payment/view/pages/payment_detail_page.dart';
import 'package:ecowave/features/profile/view/empty_session_page.dart';
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
  double totalPayment = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.token == '') {
          return const EmptyUserPage();
        }

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
                          context
                              .read<CartBloc>()
                              .add(CheckedAllItemCart(value: newValue!));
                        },
                        activeColor: AppColors.primary500,
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    EcoFormButton(
                      width: 90.0,
                      label: "Hapus",
                      onPressed: () =>
                          context.read<CartBloc>().add(DeleteAllItemCart()),
                      backgroundColor: Colors.transparent,
                      border: Border.all(
                        color: AppColors.primary500,
                      ),
                      textColor: AppColors.primary500,
                    ),
                  ],
                ),
                const Divider(),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return const EcoLoading();
                    } else if (state is CartSuccess) {
                      if (state.data.isEmpty) {
                        return SizedBox(
                          height: context.fullHeight / 1.5,
                          child: Center(
                            child: EcoEmpty(
                              massage: "Tidak ada Produk",
                              image: AppImages.emptyKeranjang,
                              height: context.fullWidth / 2,
                            ),
                          ),
                        );
                      }
                      return Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.only(left: 14, top: 32),
                          itemCount: state.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListItem(
                              cartModel: state.data[index],
                              onPressed: () => context.read<CartBloc>().add(
                                  DeleteItemCart(id: state.data[index].id)),
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
                      return const Text('error');
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                )
              ],
            ),
          ),
          bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return const EcoLoading();
              } else if (state is CartSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(AppSizes.primary),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Total Pembayaran'),
                            Text(
                              state.total.toInt().currencyFormatRp,
                              style: const TextStyle(
                                  fontWeight: AppFontWeight.semibold),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: EcoFormButton(
                          label: 'Beli',
                          onPressed: state.total.toInt() == 0
                              ? null
                              : () => context
                                  .push(PaymentDetailPage(carts: state.data)),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        );
      },
    );
  }
}
