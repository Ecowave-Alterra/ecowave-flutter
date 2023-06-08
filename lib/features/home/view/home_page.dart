import 'package:ecowave/features/home/bloc/page_bloc.dart';
import 'package:ecowave/features/home/view/dashboard_page.dart';
import 'package:ecowave/features/transaction/view/pages/history_transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../profile/view/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: const [
              DashboardPage(),
              HistoryTransactionPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColors.primary50,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                _BottomNavCustom(
                  index: 0,
                  label: "Beranda",
                  icon: AppIcons.beranda,
                  state: state,
                ),
                _BottomNavCustom(
                  index: 1,
                  label: "Pesanan",
                  icon: AppIcons.pesanan,
                  state: state,
                ),
                _BottomNavCustom(
                  index: 2,
                  label: "Saya",
                  icon: AppIcons.username,
                  state: state,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BottomNavCustom extends StatelessWidget {
  final int index;
  final String label;
  final AssetImage icon;
  final int state;

  const _BottomNavCustom({
    required this.index,
    required this.label,
    required this.icon,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<PageBloc>().add(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color:
                    state == index ? AppColors.primary300 : Colors.transparent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppSizes.primary),
                ),
              ),
              child: ImageIcon(
                icon,
                color: state == index ? AppColors.grey700 : AppColors.grey600,
              ),
            ),
            4.0.height,
            Text(
              label,
              style: TextStyle(
                fontSize: state == index ? 14.0 : 12.0,
                color: state == index ? AppColors.black : AppColors.grey700,
                fontWeight: state == index
                    ? AppFontWeight.semibold
                    : AppFontWeight.regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
