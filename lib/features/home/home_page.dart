import 'package:ecowave/features/home/dashboard_page.dart';
import 'package:ecowave/features/transaction/view/pages/history_transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';

import '../profile/view/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          DashboardPage(),
          HistoryTransactionPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: AppColors.grey500,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () => _onTap(0),
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 4), 
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                  decoration: BoxDecoration(
                      color: _currentIndex == 0
                          ? AppColors.primary300
                          : AppColors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const ImageIcon(
                    AppIcons.beranda,
                  ),
                ),
              ),
            ),
            label: 'Dashboard',
            backgroundColor: AppColors.white,
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () => _onTap(1),
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 4), 
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                  decoration: BoxDecoration(
                      color: _currentIndex == 1
                          ? AppColors.primary300
                          : AppColors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const ImageIcon(
                    AppIcons.pesanan,
                  ),
                ),
              ),
            ),
            label: 'Pesanan',
            backgroundColor: AppColors.white,
          ),
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () => _onTap(2),
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 4), 
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                  decoration: BoxDecoration(
                      color: _currentIndex == 2
                          ? AppColors.primary300
                          : AppColors.white, 
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const ImageIcon(
                    AppIcons.profile,
                  ),
                ),
              ),
            ),
            label: 'Profil',
            backgroundColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
