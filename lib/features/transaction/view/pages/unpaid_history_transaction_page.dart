import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/bloc/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/view/pages/unpaid_transaction_detail_page.dart';
import 'package:ecowave/features/transaction/view/widgets/empty_state.dart';
import 'package:ecowave/features/transaction/view/widgets/product_transaction_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UnpaidHistoryTransactionPage extends StatelessWidget {
  const UnpaidHistoryTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HistoryTransactionBloc>().add(GetHistoryTransactionEvent());
    return BlocBuilder<HistoryTransactionBloc, HistoryTransactionState>(
        builder: (context, state) {
      if (state is HistoryTransactionLoading) {
        return const EcoLoading();
      } else if (state is HistoryTransactionFailed) {
        return EcoError(errorMessage: state.message, onRetry: () {});
      } else if (state is HistoryTransactionSuccess) {
        return ListView.builder(
            itemCount: state.dataUnpaid.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              // print("Ada data gasih ${state.dataUnpaid}");
              final cUnpaid = state.dataUnpaid[index];
              // print("ada data unpaid gak $cUnpaid");
              return ProductTransactionWidget(
                  statusOrder: cUnpaid.statusTransaction,
                  imageUrl: cUnpaid.productTransaction[0].productImageUrl,
                  colorTextStatusOrder: AppColors.error500,
                  productName: cUnpaid.productTransaction[0].productName,
                  totalProductPrice: cUnpaid.productTransaction[0].price,
                  totalProduct: cUnpaid.productTransaction[0].qty,
                  totalProductOrder: cUnpaid.productTransaction.length,
                  totalProductOrderPrice: cUnpaid.totalPrice,
                  descriptionStatus:
                      "Silahkan melakukan pembayaran agar pesanan segera diproses",
                  onPressedDetail: () {
                    context.push(UnpaidTransactionDetailPage(
                      detailTransaction: cUnpaid,
                    ));
                  },
                  onPressedAction: () {},
                  buttonName: "Bayar Sekarang");
            });
      } else {
        return const EmptyState();
      }
    });
  }
}
