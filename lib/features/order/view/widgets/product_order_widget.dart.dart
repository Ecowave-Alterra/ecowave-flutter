import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

class StatusOrderWidget extends StatelessWidget {
  final String? statusOrder;
  final Color? colorTextStatusOrder;
  final String? imageUrl;
  final String? productName;
  final int? totalProduct;
  final int? totalProductPrice;
  final int? totalProductOrder;
  final int? totalProductOrderPrice;
  final String? descriptionStatus;
  final String? buttonName;
  final VoidCallback? onPressedDetail;
  final VoidCallback? onPressedAction;
  final Color? colorBackgroundButton;
  final Color? colorTextButton;

  const StatusOrderWidget(
      {super.key,
      required this.statusOrder,
      required this.imageUrl,
      required this.productName,
      required this.totalProduct,
      required this.totalProductPrice,
      required this.totalProductOrder,
      required this.totalProductOrderPrice,
      required this.descriptionStatus,
      required this.onPressedDetail,
      required this.onPressedAction,
      required this.buttonName,
      this.colorBackgroundButton,
      this.colorTextButton,
      this.colorTextStatusOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.blueGrey,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    ImageIcon(AppIcons.shopPesanan),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Eco Shop"),
                  ],
                ),
                Text(
                  statusOrder ?? "",
                  style: TextStyle(
                      color: colorTextStatusOrder ?? AppColors.primary500),
                ),
              ],
            ),
            16.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(),
                  height: 70,
                  width: 90,
                  // child: Image.asset(
                  //   "assets/images/productShop2.png",
                  //   fit: BoxFit.cover,
                  // ),
                  child: Image.network(imageUrl ?? ""),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(productName ?? ""),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("x"),
                          Text(totalProduct.toString()),
                        ],
                      ),
                      Text(totalProductPrice!.currencyFormatRp),
                    ],
                  ),
                )
              ],
            ),
            8.0.height,
            const Divider(),
            16.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      totalProductOrder.toString(),
                    ),
                    const Text(
                      " Produk",
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Total Pesanan : ",
                    ),
                    Text(
                      totalProductOrderPrice!.currencyFormatRp,
                      style:
                          const TextStyle(fontWeight: AppFontWeight.semibold),
                    )
                  ],
                ),
              ],
            ),
            28.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                InkWell(
                  onTap: onPressedDetail,
                  child: const Text(
                    "Rincian Pesanan",
                    style: TextStyle(color: AppColors.grey600),
                  ),
                )
              ],
            ),
            10.0.height,
            const Divider(),
            8.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    descriptionStatus ?? "",
                    style: const TextStyle(color: AppColors.grey600),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            colorBackgroundButton ?? AppColors.primary500),
                    onPressed: onPressedAction,
                    child: Text(
                      buttonName ?? "",
                      style: TextStyle(
                          fontWeight: AppFontWeight.semibold,
                          color: colorTextButton ?? AppColors.white),
                    )),
              ],
            ),
          ],
        ));
  }
}
