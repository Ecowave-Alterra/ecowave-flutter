import 'package:ecowave/core.dart';
import 'package:ecowave/features/history_pesanan/view/pages/rincian_pesanan_page.dart';
import 'package:ecowave/features/history_pesanan/view/widgets/empty_state.dart';
import 'package:flutter/material.dart';

class HistoryPesananPage extends StatefulWidget {
  const HistoryPesananPage({super.key});

  @override
  State<HistoryPesananPage> createState() => _HistoryPesananPageState();
}

class _HistoryPesananPageState extends State<HistoryPesananPage>
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
              // color: Colors.red,
              decoration: const BoxDecoration(),
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      Container(
                          // color: Colors.blueGrey,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ImageIcon(AppIcons.shopPesanan),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("Eco Shop"),
                                    ],
                                  ),
                                  Text(
                                    "Belum Bayar",
                                    style: TextStyle(color: AppColors.error500),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
                                    height: 70,
                                    width: 90,
                                    child: Image.asset(
                                      "assets/images/productShop2.png",
                                      fit: BoxFit.cover,
                                    ),
                                    // child: Image.network(
                                    //     "https://cdn.shopify.com/s/files/1/0054/6737/3638/products/rug-1651050782034-0_large.jpg?v=1651125749"),
                                  ),
                                  const Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text("Totebag Tas belanja serbaguna"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text("x"),
                                            Text("1"),
                                          ],
                                        ),
                                        Text("15.000"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 16,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("1 Produk"),
                                  Row(
                                    children: [
                                      Text("Total Pesanan : "),
                                      Text(
                                        "Rp.20.000",
                                        style: TextStyle(
                                            fontWeight: AppFontWeight.semibold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 28,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(),
                                  InkWell(
                                    onTap: () {
                                      context.push(const RincianPesananPage());
                                    },
                                    child: const Text(
                                      "Lihat Rincian",
                                      style:
                                          TextStyle(color: AppColors.grey600),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    child: Text(
                                      "Silahkan melakukan pembayaran agar pesanan segera diproses",
                                      style:
                                          TextStyle(color: AppColors.grey600),
                                    ),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primary500),
                                      onPressed: () {},
                                      child: const Text(
                                        "Bayar Sekarang",
                                        style: TextStyle(
                                            fontWeight: AppFontWeight.semibold,
                                            color: AppColors.white),
                                      )),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                  const EmptyState(),
                  const Center(
                    child: Text("c"),
                  ),
                  const Center(
                    child: Text("d"),
                  ),
                  const Center(
                    child: Text("e"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
