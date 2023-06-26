import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/tabbar/tabbar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:ecowave/features/transaction/view/pages/failed_history_transaction_page.dart';
import 'package:ecowave/features/transaction/view/pages/packed_history_transaction_page.dart';
import 'package:ecowave/features/transaction/view/pages/sending_history_transaction_page.dart';
import 'package:ecowave/features/transaction/view/pages/success_history_transaction_page.dart';
import 'package:ecowave/features/transaction/view/pages/unpaid_history_transaction_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryTransactionPage extends StatefulWidget {
  const HistoryTransactionPage({super.key});

  @override
  State<HistoryTransactionPage> createState() => _HistoryTransactionPageState();
}

class _HistoryTransactionPageState extends State<HistoryTransactionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabbarBloc, int>(
      builder: (context, state) {
        return DefaultTabController(
          length: 5,
          initialIndex: state,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("History Pesanan"),
            ),
            body: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  physics: const ScrollPhysics(),
                  indicatorColor: Colors.transparent,
                  labelColor: AppColors.primary600,
                  dividerColor: Colors.transparent,
                  indicator: const BoxDecoration(),
                  labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  tabs: const <Widget>[
                    Tab(
                      text: "Belum Bayar",
                    ),
                    Tab(
                      text: "Dikemas",
                    ),
                    Tab(
                      text: "Dikirim",
                    ),
                    Tab(
                      text: "Selesai",
                    ),
                    Tab(
                      text: "Dibatalkan",
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        UnpaidHistoryTransactionPage(
                          moveTab: moveTabFailed,
                        ),
                        const PackedHistoryTransactionPage(),
                        SendingHistoryTransactionPage(
                          moveTab: moveTabSuccess,
                        ),
                        SuccessHistoryTransactionPage(
                          moveTab: moveTabSuccess,
                        ),
                        const FailedHistoryTransactionPage(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void moveTabFailed() {
    _tabController.animateTo(4);
  }

  void moveTabSuccess() {
    _tabController.animateTo(3);
  }
}
