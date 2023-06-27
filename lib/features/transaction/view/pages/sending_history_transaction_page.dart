import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/bloc/tabbar/tabbar_bloc.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:ecowave/features/transaction/view/pages/paid_transaction_detail_page.dart';
import 'package:ecowave/features/transaction/view/widgets/empty_state.dart';
import 'package:ecowave/features/transaction/view/widgets/product_transaction_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendingHistoryTransactionPage extends StatelessWidget {
  final Function moveTab;
  const SendingHistoryTransactionPage({super.key, required this.moveTab});

  @override
  Widget build(BuildContext context) {
    context
        .read<HistoryTransactionBloc>()
        .add(const GetHistorySendingTransactionEvent());
    return BlocBuilder<HistoryTransactionBloc, HistoryTransactionState>(
        builder: (context, state) {
      if (state is HistoryTransactionLoading) {
        return const EcoLoading();
      }
      if (state is HistoryTransactionEmpty) {
        return const EmptyState();
      } else if (state is HistoryTransactionFailed) {
        return EcoError(errorMessage: state.message, onRetry: () {});
      } else if (state is HistorySendingTransactionSuccess) {
        if (state.dataSending.isEmpty) {
          return const EmptyState();
        } else {
          return ListView.builder(
              itemCount: state.dataSending.length,
              itemBuilder: (BuildContext context, int index) {
                final HistoryTransactionModel cSending =
                    state.dataSending[index];
                if (DateTime.now()
                        .difference(DateTime.parse(cSending.createdAt))
                        .inDays >=
                    10) {
                  context
                      .read<HistoryTransactionBloc>()
                      .add(AddConfirmTransactionEvent(cSending.transactionId));
                }
                return ProductTransactionWidget(
                  statusOrder: cSending.statusTransaction,
                  imageUrl: cSending.orderDetail[0].productImageUrl,
                  colorTextStatusOrder: AppColors.primary500,
                  productName: cSending.orderDetail[0].productName,
                  totalProductPrice: cSending.orderDetail[0].subTotalPrice,
                  totalProduct: cSending.orderDetail[0].qty,
                  totalProductOrder: cSending.orderDetail.length,
                  totalProductOrderPrice: cSending.totalPrice,
                  descriptionStatus:
                      "Pesanan sedang dalam pengiriman, silahkan konfirmasi setelah menerima pesanan",
                  onPressedDetail: () {
                    context.push(
                        PaidTransactionDetailPage(detailTransaction: cSending));
                  },
                  onPressedAction: () {
                    showConfirmation(
                        title: 'Kamu bakal melepaskan Rp20.000 ke penjual',
                        message:
                            'Pastikan paket sudah sesuai dan diterima, ya!',
                        nameButtonConfirmation: 'Iya',
                        colorButtonConfirmation: AppColors.primary500,
                        pressNavConfirmation: () {
                          context.read<HistoryTransactionBloc>().add(
                              AddConfirmTransactionEvent(
                                  cSending.transactionId));
                          context.popToRoot();
                          context.read<TabbarBloc>().add((4));
                          moveTab();
                          "Yeey, dana berhasil dilepaskan!".succeedBar(context);
                        },
                        context: context,
                        nameButtonUnConfirmation: 'Tidak');
                  },
                  buttonName: "Pesanan Diterima",
                );
              });
        }
      } else {
        return const EmptyState();
      }
    });
  }
}
