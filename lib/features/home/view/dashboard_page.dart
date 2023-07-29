import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/auth/view/login_page.dart';
import 'package:ecowave/features/ecommerce/bloc/product_home/product_bloc.dart';
import 'package:ecowave/features/ecommerce/view/pages/home_e_commerce_page.dart';
import 'package:ecowave/features/ecommerce/view/pages/product_detail_page.dart';
import 'package:ecowave/features/information/bloc/information/information_bloc.dart';
import 'package:ecowave/features/information/view/pages/feed_information_page.dart';
import 'package:ecowave/features/information/view/widget/carousel_information_card_widget.dart';
import 'package:ecowave/features/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    context.read<ProductBloc>().add(GetProductEvent());
    context.read<ProfileBloc>().add(GetDataUser());
    context.read<InformationBloc>().add(const GetInformationEvent(id: 1));
    super.initState();
  }

  int _currentinfo = 0;
  final CarouselController _controllerinfo = CarouselController();
  int _currentproduct = 0;
  final CarouselController _controllerProduct = CarouselController();

  Future<void> _refreshData() async {
    context.read<ProductBloc>().add(GetProductEvent());
    context.read<ProfileBloc>().add(GetDataUser());

    context.read<InformationBloc>().add(const GetInformationEvent(id: 1));

    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          onRefresh: _refreshData,
          child: SafeArea(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 155,
                      decoration: const BoxDecoration(
                        color: AppColors.primary500,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                          bottomRight: Radius.circular(36),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 70.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.primary),
                              child: BlocConsumer<ProfileBloc, ProfileState>(
                                listener: (context, state) {
                                  if (state.status == DataStateStatus.error) {
                                    context.pushReplacement(const LoginPage());
                                  }
                                },
                                builder: (context, state) {
                                  String name = state.user.name;

                                  if (name != '') {
                                    return Text(
                                      'Hello, $name!',
                                      style: const TextStyle(
                                          fontSize: AppSizes.buttonFontSize,
                                          fontWeight: AppFontWeight.extrabold,
                                          color: AppColors.white),
                                    );
                                  } else {
                                    return const Text(
                                      "Hello, User!",
                                      style: TextStyle(
                                          fontSize: AppSizes.buttonFontSize,
                                          fontWeight: AppFontWeight.extrabold,
                                          color: AppColors.white),
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: AppSizes.primary,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.primary),
                              child: Container(
                                height: 90,
                                padding: const EdgeInsets.all(AppSizes.primary),
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(
                                      color: AppColors.grey50,
                                      width: 1.0,
                                    ),
                                    borderRadius:
                                        BorderRadius.circular(AppSizes.radius)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Row(
                                          children: [
                                            Text(
                                              "EcoPoint  ",
                                              style: TextStyle(
                                                  fontWeight:
                                                      AppFontWeight.bold),
                                            ),
                                            Tooltip(
                                              verticalOffset: 35,
                                              message:
                                                  'Point ini bisa ditukarkan\ndengan barang',
                                              preferBelow: false,
                                              showDuration:
                                                  Duration(seconds: 3),
                                              child: Icon(
                                                Icons.info,
                                                color: AppColors.primary500,
                                                size: AppSizes.primary,
                                              ),
                                            ),
                                          ],
                                        ),
                                        BlocBuilder<ProfileBloc, ProfileState>(
                                          builder: (context, state) {
                                            return Text(
                                              state.user.point.toString(),
                                              style: const TextStyle(
                                                fontSize: AppSizes.secondary,
                                                fontWeight:
                                                    AppFontWeight.extrabold,
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                    const ImageIcon(
                                      AppIcons.ecoPoints,
                                      size: 48,
                                      color: AppColors.grey500,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSizes.primary),
                              child: GridView.count(
                                padding: const EdgeInsets.only(
                                    top: AppSizes.primary),
                                crossAxisCount: 2,
                                childAspectRatio: 1.1,
                                crossAxisSpacing: AppSizes.primary,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppSizes.radius),
                                      side: const BorderSide(
                                        color: AppColors.grey50,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Container(
                                      color: AppColors.white,
                                      child: GestureDetector(
                                        onTap: () =>
                                            context.push(const HomeECommerce()),
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ImageIcon(
                                              AppIcons.ecoShop,
                                              size: 70,
                                              color: AppColors.primary700,
                                            ),
                                            SizedBox(
                                                height: AppSizes.secondary),
                                            Text(
                                              'EcoShop',
                                              style: TextStyle(
                                                  fontSize: AppSizes.primary),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          AppSizes.radius),
                                      side: const BorderSide(
                                        color: AppColors.grey50,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Container(
                                      color: AppColors.white,
                                      child: GestureDetector(
                                        onTap: () => context
                                            .push(const InformationPage()),
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ImageIcon(
                                              AppIcons.ecoInfo,
                                              size: 70,
                                              color: AppColors.primary700,
                                            ),
                                            SizedBox(
                                                height: AppSizes.secondary),
                                            Text(
                                              'EcoInfo',
                                              style: TextStyle(
                                                  fontSize: AppSizes.primary),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AppSizes.secondary.height,
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.primary),
                              child: Text(
                                "Lagi nyari Product Ramah Lingkungan?",
                                style: TextStyle(
                                    fontWeight: AppFontWeight.extrabold,
                                    fontSize: AppSizes.primary),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.primary),
                              child: Text(
                                "Beli barang di EcoShop dengan EcoPoints ",
                                style: TextStyle(
                                    color: AppColors.grey500,
                                    fontSize: AppSizes.primary),
                              ),
                            ),
                            const SizedBox(
                              height: AppSizes.primary,
                            ),
                            BlocBuilder<ProductBloc, ProductState>(
                                builder: (context, state) {
                              if (state is ProductLoading) {
                                return const EcoLoading();
                              } else if (state is ProductFailed) {
                                return EcoError(
                                  errorMessage: state.message,
                                  onRetry: () {},
                                );
                              } else if (state is ProductSuccess) {
                                List<Widget> carouselItems = [];
                                final product = state.data;
                                for (int i = 0; i < 3; i++) {
                                  carouselItems.add(
                                    GestureDetector(
                                      onTap: () {
                                        context.push(ProductDetail(
                                          productModel: state.data[i],
                                        ));
                                        FocusScope.of(context).unfocus();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: CachedNetworkImage(
                                            imageUrl: (product[i]
                                                    .productImageUrl!
                                                    .isNotEmpty)
                                                ? (product[i]
                                                        .productImageUrl?[0] ??
                                                    'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg')
                                                : 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                            height: 120,
                                            fit: BoxFit.fitHeight,
                                            errorWidget:
                                                (context, url, error) =>
                                                    const ImageIcon(
                                              AppIcons.warning,
                                              color: AppColors.primary500,
                                              size: 50,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return CarouselSlider(
                                  items: carouselItems.map((widget) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: AppColors
                                            .grey50, // Ganti dengan warna latar belakang yang diinginkan
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: AppColors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: widget,
                                    );
                                  }).toList(),
                                  options: CarouselOptions(
                                    height: 120,
                                    autoPlay: true,
                                    enableInfiniteScroll: false,
                                    disableCenter: true,
                                    viewportFraction: 0.94,
                                    aspectRatio: 2.0,
                                    onPageChanged: (index, reason) {
                                      if (_currentproduct != index) {
                                        setState(() {
                                          _currentproduct = index;
                                        });
                                      }
                                    },
                                  ),
                                );
                              }
                              return const SizedBox();
                            }),
                            const SizedBox(
                              height: AppSizes.primary,
                            ),
                            BlocBuilder<ProductBloc, ProductState>(
                              builder: (context, state) {
                                if (state is ProductLoading) {
                                  return const SizedBox();
                                } else if (state is ProductSuccess) {
                                  final informationList =
                                      state.data.take(3).toList();
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: informationList
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return GestureDetector(
                                        onTap: () => _controllerProduct
                                            .animateToPage(entry.key),
                                        child: Container(
                                          width: 12.0,
                                          height: 12.0,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _currentproduct == entry.key
                                                ? AppColors.primary500
                                                : const Color(0xffD9D9D9),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                            const SizedBox(
                              height: AppSizes.primary,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.primary),
                              child: Text(
                                "Banyak cara menjaga lingkungan, loh!",
                                style: TextStyle(
                                    fontWeight: AppFontWeight.extrabold,
                                    fontSize: AppSizes.primary),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.primary),
                              child: Text(
                                "Temukan caranya di EcoInfo dan dapatkan EcoPoints",
                                style: TextStyle(
                                    color: AppColors.grey500,
                                    fontSize: AppSizes.primary),
                              ),
                            ),
                            const SizedBox(
                              height: AppSizes.primary,
                            ),
                            BlocBuilder<InformationBloc, InformationState>(
                              builder: (context, state) {
                                if (state is InformationLoading) {
                                  return const EcoLoading();
                                } else if (state is InformationSuccess) {
                                  return Column(
                                    children: [
                                      CarouselSlider.builder(
                                        itemCount: state.data.length > 3
                                            ? 3
                                            : state.data.length,
                                        itemBuilder:
                                            (context, index, realIndex) {
                                          return CarouselCardInformation(
                                            informationModel: state.data[index],
                                          );
                                        },
                                        carouselController: _controllerinfo,
                                        options: CarouselOptions(
                                          height: 150,
                                          autoPlay: true,
                                          enableInfiniteScroll: false,
                                          disableCenter: true,
                                          viewportFraction: 0.94,
                                          aspectRatio: 2.0,
                                          onPageChanged: (index, reason) {
                                            setState(
                                              () {
                                                _currentinfo = index;
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                            const SizedBox(
                              height: AppSizes.primary,
                            ),
                            BlocBuilder<InformationBloc, InformationState>(
                              builder: (context, state) {
                                if (state is InformationLoading) {
                                  return const SizedBox();
                                } else if (state is InformationSuccess) {
                                  final informationList =
                                      state.data.take(3).toList();
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: informationList
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return GestureDetector(
                                        onTap: () => _controllerinfo
                                            .animateToPage(entry.key),
                                        child: Container(
                                          width: 12.0,
                                          height: 12.0,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _currentinfo == entry.key
                                                ? AppColors.primary500
                                                : const Color(0xffD9D9D9),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
