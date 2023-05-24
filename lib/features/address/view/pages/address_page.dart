import 'package:ecowave/features/address/view/pages/add_adress_page.dart';
import 'package:flutter/material.dart';

import '../../../../core.dart';

class AddressPage extends StatelessWidget {
  final List listUser;
  const AddressPage({super.key, required this.listUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const ImageIcon(AppIcons.leftBack,
              color: AppColors.primary500, size: 12),
        ),
        title: const Text(
          'Alamat Saya',
          style: TextStyle(
            fontSize: 20,
            fontWeight: AppFontWeight.regular,
            color: AppColors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pop(AddressAddPage());
            },
            icon: const ImageIcon(AppIcons.add,
                color: AppColors.primary500, size: 12),
          ),
        ],
        backgroundColor: AppColors.white,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: AppColors.grey300,
            height: 2.0,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: listUser.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${listUser[index].name} (${listUser[index].place})',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: AppFontWeight.semibold,
                        color: AppColors.black,
                      ),
                    ),
                    6.0.height,
                    Text(
                      '${listUser[index].telp}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: AppFontWeight.regular,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      '${listUser[index].address}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: AppFontWeight.regular,
                        color: AppColors.black,
                      ),
                    ),
                    6.0.height,
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: AppColors.primary500),
                      ),
                      child: const Text(
                        'Utama',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: AppFontWeight.regular,
                          color: AppColors.primary500,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 40,
                  // padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.primary500),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ubah',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: AppFontWeight.semibold,
                        color: AppColors.primary500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.grey500,
        ),
      ),
    );
  }
}
