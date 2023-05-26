import 'package:ecowave/core.dart';
import 'package:ecowave/features/order/model/checkout_model.dart';
import 'package:ecowave/features/order/view/pages/paid_order_detail_page.dart';
import 'package:ecowave/features/order/view/pages/unpaid_order_detail_page.dart';
import 'package:ecowave/features/order/view/widgets/empty_state.dart';
import 'package:ecowave/features/order/view/widgets/product_order_widget.dart.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage>
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
                  //
                  //STATUS PRODUK BELUM BAYAR
                  //
                  ListView.builder(
                      itemCount: checkoutUnpaid.length,
                      itemBuilder: (BuildContext context, int index) {
                        final cUnpaid = checkoutUnpaid[index];
                        return StatusOrderWidget(
                            statusOrder: cUnpaid.status,
                            imageUrl: cUnpaid.order[0].product.imageUrl,
                            colorTextStatusOrder: AppColors.error500,
                            productName: cUnpaid.order[0].product.productName,
                            totalProductPrice:
                                cUnpaid.order[0].totalProductPrice,
                            totalProduct: cUnpaid.order[0].totalProduct,
                            totalProductOrder: cUnpaid.order.length,
                            totalProductOrderPrice: cUnpaid.totalOrderPrice,
                            descriptionStatus:
                                "Silahkan melakukan pembayaran agar pesanan segera diproses",
                            onPressedDetail: () {
                              context.push(UnpaidOrderDetailPage(
                                orderUnpaid: cUnpaid,
                              ));
                            },
                            onPressedAction: () {},
                            buttonName: "Bayar Sekarang");
                      }),
                  //
                  //STATUS PRODUK DIKEMAS
                  //
                  ListView.builder(
                      itemCount: checkoutPacked.length,
                      itemBuilder: (BuildContext context, int index) {
                        final cPacked = checkoutPacked[index];
                        return StatusOrderWidget(
                          statusOrder: cPacked.status,
                          imageUrl: cPacked.order[0].product.imageUrl,
                          colorTextStatusOrder: AppColors.primary500,
                          productName: cPacked.order[0].product.productName,
                          totalProductPrice: cPacked.order[0].totalProductPrice,
                          totalProduct: cPacked.order[0].totalProduct,
                          totalProductOrder: cPacked.order.length,
                          totalProductOrderPrice: cPacked.totalOrderPrice,
                          descriptionStatus:
                              "Silahkan melakukan pembayaran agar pesanan segera diproses",
                          onPressedDetail: () {
                            context.push(PaidOrderDetailPage(
                              orderPaid: cPacked,
                            ));
                          },
                          onPressedAction: () {},
                          buttonName: "Bayar Sekarang",
                          colorTextButton: AppColors.primary300,
                          colorBackgroundButton: AppColors.primary50,
                        );
                      }),
                  //
                  //STATUS PRODUK DIKIRIM
                  //
                  const EmptyState(),
                  //
                  //STATUS PRODUK SELESAI
                  //
                  const EmptyState(),
                  //
                  //STATUS PRODUK DIBATALKAN
                  //
                  const EmptyState(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
