import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/ecommerce/view/pages/home_e_commerce_page.dart';
import 'package:ecowave/features/information/view/pages/feed_information_page.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final String nama = '';
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
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
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 70.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.primary),
                            child: Text(
                              "Hello, Dayuna!",
                              style: TextStyle(
                                  fontSize: AppSizes.buttonFontSize,
                                  fontWeight: AppFontWeight.extrabold,
                                  color: AppColors.white),
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
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "EcoPoint  ",
                                            style: TextStyle(
                                                fontWeight: AppFontWeight.bold),
                                          ),
                                          Tooltip(
                                            verticalOffset: 35,
                                            message:
                                                'Point ini bisa ditukarkan\ndengan barang',
                                            preferBelow: false,
                                            showDuration: Duration(seconds: 3),
                                            child: Icon(
                                              Icons.info,
                                              color: AppColors.primary500,
                                              size: AppSizes.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "1000",
                                        style: TextStyle(
                                            fontSize: AppSizes.secondary,
                                            fontWeight:
                                                AppFontWeight.extrabold),
                                      )
                                    ],
                                  ),
                                  ImageIcon(
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
                              padding:
                                  const EdgeInsets.only(top: AppSizes.primary),
                              crossAxisCount: 2,
                              childAspectRatio: 1.1,
                              crossAxisSpacing: AppSizes.primary,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSizes.radius),
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
                                          SizedBox(height: AppSizes.secondary),
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
                                    borderRadius:
                                        BorderRadius.circular(AppSizes.radius),
                                    side: const BorderSide(
                                      color: AppColors.grey50,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Container(
                                    color: AppColors.white,
                                    child: GestureDetector(
                                      onTap: () =>
                                          context.push(const InformationPage()),
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ImageIcon(
                                            AppIcons.ecoInfo,
                                            size: 70,
                                            color: AppColors.primary700,
                                          ),
                                          SizedBox(height: AppSizes.secondary),
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
                            padding: const EdgeInsets.symmetric(
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
                          CarouselSlider(
                            items: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  AppImages.homeShop,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  AppImages.homeShop,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              height: 120,
                              enableInfiniteScroll: false,
                              disableCenter: true,
                              viewportFraction: 0.94,
                              aspectRatio: 2.0,
                            ),
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
                          CarouselSlider(
                            items: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  AppImages.homeInfo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  AppImages.homeInfo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              height: 120,
                              enableInfiniteScroll: false,
                              disableCenter: true,
                              viewportFraction: 0.94,
                              aspectRatio: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
