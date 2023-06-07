import 'package:ecowave/features/cart/bloc/cart/cart_bloc.dart';
import 'package:ecowave/features/cart/model/entity/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core.dart';

class ListItem extends StatefulWidget {
  ListItem({
    super.key,
    required this.price,
    required this.id,
    required this.image,
    required this.item,
    required this.detail,
    required this.onPressed,
    required this.totalItems,
    required this.checkedItems,
  });
  final String item, detail, image, price, id;
  final int totalItems;
  late bool checkedItems;
  final void Function() onPressed;
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: AppColors.primary500,
              value: widget.checkedItems,
              onChanged: (value) => context.read<CartBloc>().add(
                    CheckedItemCart(value: value!, id: widget.id),
                  ),
            ),
            Image.asset(
              widget.image,
              height: 55,
            ),
            16.0.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item,
                  style: const TextStyle(
                    fontWeight: AppFontWeight.semibold,
                  ),
                ),
                12.0.height,
                Text(
                  widget.detail,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: AppFontWeight.regular,
                  ),
                ),
                12.0.height,
                Text(
                  'Rp. ${widget.price}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: AppFontWeight.regular,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 215,
                ),
                InkWell(
                    child: const ImageIcon(
                      AppIcons.min,
                      size: 10,
                      color: AppColors.grey500,
                    ),
                    onTap: () => context
                        .read<CartBloc>()
                        .add(ReduceTotalItemCart(id: widget.id))),
                12.5.width,
                BlocBuilder<CartBloc, List<CartModel>>(
                  builder: (context, state) {
                    return Text(widget.totalItems.toString());
                  },
                ),
                12.5.width,
                InkWell(
                    child: const ImageIcon(
                      AppIcons.add,
                      size: 10,
                      color: AppColors.primary500,
                    ),
                    onTap: () => context
                        .read<CartBloc>()
                        .add(AddTotalItemCart(id: widget.id))),
              ],
            ),
            const Spacer(),
            TextButton(
              onPressed: widget.onPressed,
              child: const Text(
                'Hapus',
                style: TextStyle(
                  color: AppColors.error500,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
