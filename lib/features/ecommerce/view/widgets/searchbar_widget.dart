import 'package:ecowave/features/ecommerce/bloc/product_home/product_bloc.dart';
import 'package:flutter/material.dart';

import 'package:ecowave/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

enum SingingCharacter { tertinggi, terendah }

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController search = TextEditingController();
  SingingCharacter? character = SingingCharacter.tertinggi;
  int isFilterOn = 0;
  int isProductCategory = 0;
  int isSearch = 0;
  String sortProduct = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AppSizes.primary),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 287,
            height: 56,
            child: TextFormField(
              controller: search,
              keyboardType: TextInputType.name,
              style: const TextStyle(backgroundColor: AppColors.white),
              cursorColor: AppColors.black,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: AppColors.grey300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: AppColors.grey300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: AppColors.primary500),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: AppColors.grey300),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28),
                  borderSide: const BorderSide(color: AppColors.error500),
                ),
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                hintText: 'Hinted search text',
                hintStyle: const TextStyle(color: AppColors.grey500),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(18.4),
                  child: ImageIcon(
                    AppIcons.search,
                    color: AppColors.grey400,
                    size: 19,
                  ),
                ),
              ),
              onChanged: (value) {
                context.read<ProductBloc>().add(SearchProductEvent(value));
              },
            ),
          ),
          TextButton.icon(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 405,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: AppColors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 405,
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12),
                                child: Center(
                                  child: Container(
                                    height: 2,
                                    width: 72,
                                    decoration: BoxDecoration(
                                      color: AppColors.grey300,
                                      borderRadius: BorderRadius.circular(
                                        AppSizes.radius,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(AppSizes.primary),
                                child: const Text(
                                  'Filter',
                                  style: TextStyle(
                                    fontWeight: AppFontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 12),
                                child: const Text(
                                  'Kategori Barang',
                                  style: TextStyle(
                                    fontWeight: AppFontWeight.semibold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              StatefulBuilder(
                                builder: (context, setState) => Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        isProductCategory = 0;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 40.0,
                                        padding: const EdgeInsets.fromLTRB(
                                            10.0, 0, 10.0, 0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primary500),
                                          borderRadius: BorderRadius.circular(
                                              AppSizes.radius),
                                          color: isProductCategory == 0
                                              ? AppColors.primary500
                                              : AppColors.white,
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Visibility(
                                                visible: isProductCategory == 0
                                                    ? true
                                                    : false,
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 13.0),
                                                  child: ImageIcon(
                                                    AppIcons.check,
                                                    color: AppColors.white,
                                                    size: 13.99,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Semua',
                                                style: TextStyle(
                                                  color: isProductCategory == 0
                                                      ? AppColors.white
                                                      : AppColors.primary500,
                                                  fontWeight:
                                                      AppFontWeight.regular,
                                                  fontSize:
                                                      AppSizes.buttonFontSize,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        isProductCategory = 1;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 40.0,
                                        padding: const EdgeInsets.fromLTRB(
                                            10.0, 0, 10.0, 0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primary500),
                                          borderRadius: BorderRadius.circular(
                                              AppSizes.radius),
                                          color: isProductCategory == 1
                                              ? AppColors.primary500
                                              : AppColors.white,
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Visibility(
                                                visible: isProductCategory == 1
                                                    ? true
                                                    : false,
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 13.0),
                                                  child: ImageIcon(
                                                    AppIcons.check,
                                                    color: AppColors.white,
                                                    size: 13.99,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Perabot',
                                                style: TextStyle(
                                                  color: isProductCategory == 1
                                                      ? AppColors.white
                                                      : AppColors.primary500,
                                                  fontWeight:
                                                      AppFontWeight.regular,
                                                  fontSize:
                                                      AppSizes.buttonFontSize,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        isProductCategory = 2;
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 40.0,
                                        padding: const EdgeInsets.fromLTRB(
                                            10.0, 0, 10.0, 0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primary500),
                                          borderRadius: BorderRadius.circular(
                                              AppSizes.radius),
                                          color: isProductCategory == 2
                                              ? AppColors.primary500
                                              : AppColors.white,
                                        ),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Visibility(
                                                visible: isProductCategory == 2
                                                    ? true
                                                    : false,
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 13.0),
                                                  child: ImageIcon(
                                                    AppIcons.check,
                                                    color: AppColors.white,
                                                    size: 13.99,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Kantong',
                                                style: TextStyle(
                                                  color: isProductCategory == 2
                                                      ? AppColors.white
                                                      : AppColors.primary500,
                                                  fontWeight:
                                                      AppFontWeight.regular,
                                                  fontSize:
                                                      AppSizes.buttonFontSize,
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
                              Container(
                                alignment: Alignment.topLeft,
                                padding:
                                    const EdgeInsets.fromLTRB(12, 12, 12, 16),
                                child: const Text(
                                  'Harga',
                                  style: TextStyle(
                                    fontWeight: AppFontWeight.semibold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              StatefulBuilder(builder: (context, changeState) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        character = SingingCharacter.tertinggi;
                                        sortProduct = 'tertinggi';
                                        changeState(() {});
                                      },
                                      child: SizedBox(
                                        height: 18,
                                        child: Row(
                                          children: [
                                            Radio(
                                              value: SingingCharacter.tertinggi,
                                              groupValue: character,
                                              onChanged:
                                                  (SingingCharacter? value) {
                                                character =
                                                    SingingCharacter.tertinggi;
                                                changeState(() {});
                                              },
                                            ),
                                            const Text(
                                              'Harga Tertinggi',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight:
                                                    AppFontWeight.regular,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        character = SingingCharacter.terendah;
                                        sortProduct = 'terendah';
                                        changeState(() {});
                                      },
                                      child: SizedBox(
                                        height: 18,
                                        child: Row(
                                          children: [
                                            Radio(
                                              value: SingingCharacter.terendah,
                                              groupValue: character,
                                              onChanged:
                                                  (SingingCharacter? value) {
                                                character =
                                                    SingingCharacter.terendah;
                                                changeState(() {});
                                              },
                                            ),
                                            const Text(
                                              'Harga Terendah',
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight:
                                                    AppFontWeight.regular,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 28, 0, 0),
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        isFilterOn = 0;
                                        isProductCategory = 0;
                                        context
                                            .read<ProductBloc>()
                                            .add(GetProductEvent());
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 44.0,
                                        width: 171,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primary50),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: AppColors.primary50,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Atur Ulang',
                                            style: TextStyle(
                                              color: AppColors.primary500,
                                              fontWeight:
                                                  AppFontWeight.semibold,
                                              fontSize: AppSizes.buttonFontSize,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        isFilterOn = 1;
                                        isProductCategory == 1 ||
                                                isProductCategory == 2
                                            ? context.read<ProductBloc>().add(
                                                FilterProductEvent(
                                                    isProductCategory,
                                                    sortProduct))
                                            : context.read<ProductBloc>().add(
                                                SortOnlyProductEvent(
                                                    sortProduct));
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 44.0,
                                        width: 171,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primary500),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: AppColors.primary500,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Simpan',
                                            style: TextStyle(
                                              color: AppColors.white,
                                              fontWeight:
                                                  AppFontWeight.semibold,
                                              fontSize: AppSizes.buttonFontSize,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Row(
              children: [
                Visibility(
                  visible: isFilterOn == 0 ? true : false,
                  child: const ImageIcon(
                    AppIcons.filter,
                    size: 15.0,
                    color: AppColors.primary500,
                  ),
                ),
                Visibility(
                  visible: isFilterOn == 1 ? true : false,
                  child: const ImageIcon(
                    AppIcons.filterApprove,
                    size: 15.0,
                    color: AppColors.primary500,
                  ),
                ),
              ],
            ),
            label: const Text(
              'Filter',
              style: TextStyle(color: AppColors.primary500),
            ),
          ),
        ],
      ),
    );
  }
}
