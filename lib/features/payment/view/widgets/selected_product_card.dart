import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/cart/model/models/cart_model.dart';
import 'package:flutter/material.dart';

class SelectedProductCard extends StatelessWidget {
  final CartModel cartModel;

  const SelectedProductCard({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: cartModel.image,
            width: 55.0,
            height: 55.0,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const ImageIcon(
              AppIcons.warning,
              color: AppColors.primary500,
              size: 50,
            ),
          ),
          16.0.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartModel.nameItems,
                style: const TextStyle(
                  fontWeight: AppFontWeight.semibold,
                ),
              ),
              12.0.height,
              Text("Kategori : ${cartModel.detailItems}"),
              12.0.height,
              Text("${cartModel.totalItems} Barang"),
              12.0.height,
              Text(
                cartModel.totalPrice.currencyFormatRp,
                style: const TextStyle(
                  fontWeight: AppFontWeight.semibold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
