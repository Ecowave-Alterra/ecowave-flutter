import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/ecommerce/bloc/product_home/product_bloc.dart';
import 'package:ecowave/features/ecommerce/model/models/product_model.dart';
import 'package:ecowave/features/ecommerce/view/pages/product_review_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductDescription extends StatelessWidget {
  final ProductModel productModel;
  const ProductDescription({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const EcoLoading();
        } else if (state is ProductFailed) {
          return EcoError(errorMessage: state.message, onRetry: () {});
        } else if (state is ProductSuccess) {
          return Column(
            children: [
              Visibility(
                visible: productModel.stock == 0,
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.primary),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.warning300,
                      border: Border.all(color: AppColors.warning700),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(11.0, 8.0, 8.0, 8.0),
                      child: Row(
                        children: [
                          ImageIcon(
                            AppIcons.warning,
                            size: AppSizes.primary,
                            color: AppColors.warning700,
                          ),
                          SizedBox(
                            width: 19.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Barang Tidak Tersedia',
                                style: TextStyle(
                                  fontWeight: AppFontWeight.semibold,
                                  fontSize: 12.0,
                                ),
                              ),
                              Text(
                                'Untuk Sementara stok barang ini habis. Kamu\nbisa mencari barang serupa terlebih dahulu.',
                                style: TextStyle(
                                  fontWeight: AppFontWeight.medium,
                                  fontSize: 12.0,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: AppSizes.primary),
                alignment: Alignment.centerLeft,
                child: Text(
                  productModel.name,
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
                        productModel.price.toInt().currencyFormatRp,
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
                              (productModel.averageRating).toString(),
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
                      productModel.stock.toString(),
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
                    Text(
                      productModel.category,
                      style: const TextStyle(
                          fontSize: AppSizes.primary,
                          fontWeight: AppFontWeight.medium,
                          color: AppColors.primary500),
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
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                alignment: Alignment.centerLeft,
                child: Html(
                  data: productModel.description,
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
                      onPressed: () => context.push(ProductReview(
                        productModel: productModel,
                      )),
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
                        productModel.averageRating.toString(),
                        style: const TextStyle(
                            fontSize: AppSizes.primary,
                            fontWeight: AppFontWeight.semibold,
                            color: AppColors.black),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 8.0, top: 2.0, bottom: 2.0),
                      child: Text(
                        '${(productModel.review?.length) ?? 0} penilaian',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: AppFontWeight.medium,
                            color: AppColors.grey700),
                      ),
                    ),
                  ],
                ),
              ),
              (productModel.review!.isNotEmpty)
                  ? Column(
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.only(left: AppSizes.primary),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: CachedNetworkImage(
                                  width: 30.0,
                                  height: 30.0,
                                  imageUrl: (productModel
                                          .review?[0].profilePhoto ??
                                      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg'),
                                  errorWidget: (context, url, error) =>
                                      const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: ImageIcon(
                                      AppIcons.warning,
                                      color: AppColors.primary500,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  (productModel.review?[0].name ?? ''),
                                  style: const TextStyle(
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
                          child: Text(
                            (productModel.review?[0].comment ?? ''),
                            style: const TextStyle(
                              fontSize: AppSizes.primary,
                              fontWeight: AppFontWeight.regular,
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
