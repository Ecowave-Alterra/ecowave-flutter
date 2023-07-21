import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecowave/features/cart/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core.dart';
import '../../model/models/cart_model.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.cartModel, required this.onPressed});
  final CartModel cartModel;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: AppColors.primary500,
              value: cartModel.checkedItems,
              onChanged: (value) => context.read<CartBloc>().add(
                    CheckedItemCart(value: value!, id: cartModel.id),
                  ),
            ),
            CachedNetworkImage(
              imageUrl: cartModel.image,
              height: 55,
              width: 55,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const ImageIcon(
                AppIcons.warning,
                color: AppColors.primary500,
                size: 55,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    cartModel.nameItems,
                    style: const TextStyle(
                      fontWeight: AppFontWeight.semibold,
                    ),
                  ),
                ),
                12.0.height,
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    cartModel.detailItems,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                ),
                12.0.height,
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    cartModel.price.currencyFormatRp,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: AppFontWeight.regular,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            100.0.width,
            IconButton(
              onPressed: cartModel.totalItems == 1
                  ? null
                  : () => context
                      .read<CartBloc>()
                      .add(ReduceTotalItemCart(id: cartModel.id)),
              icon: ImageIcon(
                AppIcons.min,
                size: 10,
                color: cartModel.totalItems == 1
                    ? AppColors.grey500
                    : AppColors.primary500,
              ),
            ),
            Text(cartModel.totalItems.toString()),
            IconButton(
              onPressed: cartModel.totalItems == cartModel.stock
                  ? null
                  : () => context
                      .read<CartBloc>()
                      .add(AddTotalItemCart(id: cartModel.id)),
              icon: ImageIcon(
                AppIcons.add,
                size: 10,
                color: cartModel.totalItems == cartModel.stock
                    ? AppColors.grey500
                    : AppColors.primary500,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: onPressed,
              child: const Text(
                'Hapus',
                style: TextStyle(
                  color: AppColors.error500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
