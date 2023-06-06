import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/view/pages/failed_history_transaction_page.dart';
import 'package:ecowave/features/transaction/view/pages/packed_history_transaction_page.dart';
import 'package:ecowave/features/transaction/view/pages/sending_history_transaction_page.dart';
import 'package:ecowave/features/transaction/view/pages/success_history_transaction_page.dart';
import 'package:ecowave/features/transaction/view/pages/unpaid_history_transaction_page.dart';
import 'package:flutter/material.dart';

class HistoryTransactionPage extends StatefulWidget {
  const HistoryTransactionPage({super.key});

  @override
  State<HistoryTransactionPage> createState() => _HistoryTransactionPageState();
}

class _HistoryTransactionPageState extends State<HistoryTransactionPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesanan Saya'),
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
                children: const <Widget>[
                  UnpaidHistoryTransactionPage(),
                  PackedHistoryTransactionPage(),
                  SendingHistoryTransactionPage(),
                  SuccessHistoryTransactionPage(),
                  FailedHistoryTransactionPage(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
