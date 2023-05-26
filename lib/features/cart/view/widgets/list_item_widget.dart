import 'package:flutter/material.dart';

import '../../../../core.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    super.key,
    required this.price,
    required this.image,
  });
  final String price, image;
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool checkedItems = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: AppColors.primary500,
          value: checkedItems,
          onChanged: (value) {
            setState(() {
              checkedItems = value!;
            });
          },
        ),
        Image.asset(
          widget.image,
          height: 55,
        ),
        16.0.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nama Produk',
              style: TextStyle(
                fontWeight: AppFontWeight.semibold,
              ),
            ),
            12.0.height,
            const Text(
              'Detail:Rumah Tangga/Kain',
              style: TextStyle(
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
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      child: const ImageIcon(
                        AppIcons.min,
                        size: 7,
                        color: AppColors.grey500,
                      ),
                      onTap: () {
                        setState(() {
                          index -= 1;
                          if (index < 0) {
                            index = 0;
                          }
                        });
                      },
                    ),
                    12.5.width,
                    Text(index.toString()),
                    12.5.width,
                    InkWell(
                      child: const ImageIcon(
                        AppIcons.add,
                        size: 7,
                        color: AppColors.primary500,
                      ),
                      onTap: () {
                        setState(() {
                          index += 1;
                        });
                      },
                    ),
                  ],
                ),
                125.0.width,
                TextButton(
                  onPressed: () {},
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
        ),
      ],
    );
  }
}
