import 'package:flutter/material.dart';

import 'package:ecowave/core.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

enum SingingCharacter { tertinggi, terendah }

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController search = TextEditingController();
  SingingCharacter? _character = SingingCharacter.tertinggi;
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
                    child: Center(
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
                                  padding:
                                      const EdgeInsets.all(AppSizes.primary),
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Container(
                                        height: 40.0,
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primary500),
                                          borderRadius: BorderRadius.circular(
                                              AppSizes.radius),
                                          color: AppColors.white,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Semua',
                                            style: TextStyle(
                                              color: AppColors.primary500,
                                              fontWeight: AppFontWeight.regular,
                                              fontSize: AppSizes.buttonFontSize,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Container(
                                        height: 40.0,
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primary500),
                                          borderRadius: BorderRadius.circular(
                                              AppSizes.radius),
                                          color: AppColors.white,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Perabot',
                                            style: TextStyle(
                                              color: AppColors.primary500,
                                              fontWeight: AppFontWeight.regular,
                                              fontSize: AppSizes.buttonFontSize,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Container(
                                        height: 40.0,
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 0),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.primary500),
                                          borderRadius: BorderRadius.circular(
                                              AppSizes.radius),
                                          color: AppColors.white,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Kantong',
                                            style: TextStyle(
                                              color: AppColors.primary500,
                                              fontWeight: AppFontWeight.regular,
                                              fontSize: AppSizes.buttonFontSize,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 18,
                                      child: ListTile(
                                        title: const Text(
                                          'Harga Tertinggi',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                12, 0, 0, 0),
                                        leading: Radio<SingingCharacter>(
                                          value: SingingCharacter.tertinggi,
                                          groupValue: _character,
                                          onChanged: (SingingCharacter? value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      height: 18,
                                      child: ListTile(
                                        title: const Text(
                                          'Harga Terendah',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                12, 0, 0, 0),
                                        leading: Radio<SingingCharacter>(
                                          value: SingingCharacter.terendah,
                                          groupValue: _character,
                                          onChanged: (SingingCharacter? value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 28, 0, 0),
                                  child: Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {},
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
                                                fontSize:
                                                    AppSizes.buttonFontSize,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {},
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
                                                fontSize:
                                                    AppSizes.buttonFontSize,
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
                    ),
                  );
                },
              );
            },
            icon: const ImageIcon(
              AppIcons.filter,
              size: 15.0,
              color: AppColors.primary500,
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
