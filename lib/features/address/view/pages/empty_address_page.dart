import 'package:ecowave/features/address/view/pages/add_adress_page.dart';
import 'package:flutter/material.dart';

import '../../../../core.dart';

class EmptyAddress extends StatelessWidget {
  const EmptyAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alamat Saya',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(const AddressAddPage());
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.emptyState,
              width: 181,
            ),
            12.0.height,
            const Text(
              'Kamu belum menambahkan alamat',
              style: TextStyle(
                fontSize: 14,
                fontWeight: AppFontWeight.semibold,
                color: AppColors.grey500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
