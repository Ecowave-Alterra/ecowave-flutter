import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecowave/core.dart';
import 'package:ecowave/features/ecommerce/bloc/product_home/product_bloc.dart';
import 'package:ecowave/features/ecommerce/view/pages/product_detail_page.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(GetProductEvent());
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const EcoLoading();
        } else if (state is ProductFailed) {
          return EcoError(
            errorMessage: state.message,
            onRetry: () {},
          );
        } else if (state is ProductSuccess) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: (171 / 230)),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  final product = state.data[index];
                  return GestureDetector(
                    onTap: () {
                      context.push(ProductDetail(
                        productModel: state.data[index],
                      ));
                      FocusScope.of(context).unfocus();
                    },
                    child: Container(
                      width: 171,
                      height: 225,
                      margin: const EdgeInsets.only(
                          left: 8.0, bottom: AppSizes.primary, right: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey300),
                        borderRadius: BorderRadius.circular(AppSizes.radius),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0)),
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                      product.stock == 0
                                          ? Colors.grey
                                          : Colors.transparent,
                                      BlendMode.saturation),
                                  child: Image.network(
                                    (product.productImageUrl!.isNotEmpty)
                                        ? (product.productImageUrl?[0] ??
                                            'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg')
                                        : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                    height: 126,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: product.stock == 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 8.0, 10.0, 8.0),
                                    decoration: BoxDecoration(
                                        color: AppColors.grey600,
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                    child: const Text('Stok Habis',
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: AppFontWeight.medium,
                                          fontSize: 12.0,
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                                top: AppSizes.primary,
                                left: AppSizes.primary,
                                right: AppSizes.primary),
                            child: Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: AppFontWeight.regular,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              product.price.toInt().currencyFormatRp,
                              style: const TextStyle(
                                fontWeight: AppFontWeight.semibold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.only(
                                  left: AppSizes.primary,
                                  bottom: AppSizes.primary),
                              child: Row(
                                children: [
                                  const ImageIcon(
                                    AppIcons.solidUlasan,
                                    color: AppColors.warning500,
                                    size: 12,
                                  ),
                                  Text(
                                    product.averageRating.toString(),
                                    style: const TextStyle(
                                      fontWeight: AppFontWeight.medium,
                                      color: AppColors.grey700,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
