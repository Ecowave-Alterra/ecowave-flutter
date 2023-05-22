import 'package:flutter/material.dart';
import 'package:ecowave/core.dart';

import '../auth/login_page.dart';
import 'dashboard_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
          // Widget untuk halaman Dashboard
          Dashboard(),
          // Widget untuk halaman Riwayat
          Center(
            child: Text('Halaman Riwayat'),
          ),
          // Widget untuk halaman Profil
          LoginPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedItemColor: Colors.black, // Warna ikon aktif
        unselectedItemColor: AppColors.grey500,  // Warna ikon tidak aktif
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold), // Style label ikon aktif
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal), // Style label ikon tidak aktif
        type: BottomNavigationBarType.fixed, // Menetapkan jumlah item tetap di tampilan
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4), // Memberi jarak antara ikon dan label
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                decoration: BoxDecoration(
                  color: _currentIndex == 0 ?  AppColors.primary300: AppColors.white, // Kondisi untuk item yang dipilih
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: const ImageIcon(
                  AppIcons.beranda,
                ),
              ),
            ),
            label: 'Dashboard',
            backgroundColor: AppColors.white, // Background aktif
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4), // Memberijarak antara ikon dan label
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                decoration: BoxDecoration(
                  color: _currentIndex == 1 ?  AppColors.primary300: AppColors.white, // Kondisi untuk item yang dipilih
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: const ImageIcon(
                  AppIcons.pesanan,
                ),
              ),
            ),
            label: 'Pesanan',
            backgroundColor: AppColors.white, // Background tidak aktif
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4), // Memberi jarak antara ikon dan label
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
                decoration: BoxDecoration(
                  color: _currentIndex == 2 ?  AppColors.primary300: AppColors.white, // Kondisi untuk item yang dipilih
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: const ImageIcon(
                  AppIcons.profile,
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