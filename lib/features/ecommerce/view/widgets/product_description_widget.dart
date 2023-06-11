import 'package:ecowave/core.dart';
import 'package:ecowave/features/ecommerce/bloc/product_home/product_bloc.dart';
import 'package:ecowave/features/ecommerce/view/pages/product_review_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product_category/product_category_bloc.dart';

class ProductDescription extends StatelessWidget {
  final int productId;
  final int productCategoryId;
  const ProductDescription(
      {super.key, required this.productId, required this.productCategoryId});

  @override
  Widget build(BuildContext context) {
    context
        .read<ProductCategoryBloc>()
        .add(GetProductCategoryEvent(productCategoryId));
    context.read<ProductBloc>().add(GetProductDetailEvent(productId));
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const EcoLoading();
        } else if (state is ProductFailed) {
          return EcoError(errorMessage: state.message, onRetry: () {});
        } else if (state is ProductSuccess) {
          final product = state.data[0];
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: AppSizes.primary),
                alignment: Alignment.centerLeft,
                child: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: AppSizes.primary,
                    fontWeight: AppFontWeight.regular,
                    color: AppColors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: AppSizes.primary, right: AppSizes.primary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
                      child: Text(
                        product.price.toInt().currencyFormatRp,
                        style: const TextStyle(
                          fontSize: AppSizes.primary,
                          fontWeight: AppFontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    Container(
                      height: 44.0,
                      width: 51.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.primary300, width: 1.0),
                          borderRadius:
                              BorderRadius.circular(AppSizes.primary)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Text(
                              product.rating.toString(),
                              style: const TextStyle(
                                fontSize: AppSizes.primary,
                                fontWeight: AppFontWeight.medium,
                                color: AppColors.primary400,
                              ),
                            ),
                          ),
                          const ImageIcon(
                            AppIcons.solidUlasan,
                            color: AppColors.primary500,
                            size: 12.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(AppSizes.primary),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Detail Barang',
                  style: TextStyle(
                    fontSize: AppSizes.primary,
                    fontWeight: AppFontWeight.semibold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: AppSizes.primary, right: AppSizes.primary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Stok Total',
                      style: TextStyle(
                        fontSize: AppSizes.primary,
                        fontWeight: AppFontWeight.regular,
                      ),
                    ),
                    Text(
                      product.stock.toString(),
                      style: const TextStyle(
                        fontSize: AppSizes.primary,
                        fontWeight: AppFontWeight.regular,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: AppSizes.primary,
                    top: AppSizes.primary,
                    right: AppSizes.primary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Kategori',
                      style: TextStyle(
                        fontSize: AppSizes.primary,
                        fontWeight: AppFontWeight.regular,
                      ),
                    ),
                    BlocBuilder<ProductCategoryBloc, ProductCategoryState>(
                      builder: (context, state) {
                        if (state is ProductCategoryLoading) {
                          return const EcoLoading();
                        } else if (state is ProductCategoryFailed) {
                          return EcoError(
                            errorMessage: state.message,
                            onRetry: () {},
                          );
                        } else if (state is ProductCategorySuccess) {
                          final category = state.data[0];
                          return Text(
                            category.category,
                            style: const TextStyle(
                                fontSize: AppSizes.primary,
                                fontWeight: AppFontWeight.medium,
                                color: AppColors.primary500),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(AppSizes.primary),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Deskripsi Produk',
                  style: TextStyle(
                    fontSize: AppSizes.primary,
                    fontWeight: AppFontWeight.semibold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: AppSizes.primary, right: AppSizes.primary),
                alignment: Alignment.centerLeft,
                child: Text(
                  product.productDescription,
                  style: const TextStyle(
                    fontSize: AppSizes.primary,
                    fontWeight: AppFontWeight.regular,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(AppSizes.primary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ulasan',
                      style: TextStyle(
                        fontSize: AppSizes.primary,
                        fontWeight: AppFontWeight.semibold,
                      ),
                    ),
                    TextButton(
                      onPressed: () => context.push(const ProductReview()),
                      child: const Text(
                        'Lihat Semua',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: AppFontWeight.semibold,
                            color: AppColors.primary500),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: AppSizes.primary, bottom: AppSizes.primary),
                child: Row(
                  children: [
                    const ImageIcon(
                      AppIcons.solidUlasan,
                      color: AppColors.warning500,
                      size: 14.24,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        product.rating.toString(),
                        style: const TextStyle(
                            fontSize: AppSizes.primary,
                            fontWeight: AppFontWeight.semibold,
                            color: AppColors.black),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 2.0, bottom: 2.0),
                      child: const Text(
                        '599 penilaian',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: AppFontWeight.medium,
                            color: AppColors.grey700),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: AppSizes.primary),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 30.0,
                      height: 40.0,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.cardInfo4),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: const Text(
                        'Muhammad Nabil',
                        style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: AppFontWeight.medium,
                            color: AppColors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 4.0, 0, 0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 6.57),
                      child: const ImageIcon(
                        AppIcons.solidUlasan,
                        color: AppColors.warning500,
                        size: 14.24,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 6.57),
                      child: const ImageIcon(
                        AppIcons.solidUlasan,
                        color: AppColors.warning500,
                        size: 14.24,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 6.57),
                      child: const ImageIcon(
                        AppIcons.solidUlasan,
                        color: AppColors.warning500,
                        size: 14.24,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 6.57),
                      child: const ImageIcon(
                        AppIcons.solidUlasan,
                        color: AppColors.warning500,
                        size: 14.24,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 6.57),
                      child: const ImageIcon(
                        AppIcons.solidUlasan,
                        color: AppColors.warning500,
                        size: 14.24,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: AppSizes.primary, right: AppSizes.primary),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Menjelaskan produk ini dapat digunakan untuk apa dan apa manfaat dari produk ini.',
                  style: TextStyle(
                    fontSize: AppSizes.primary,
                    fontWeight: AppFontWeight.regular,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
