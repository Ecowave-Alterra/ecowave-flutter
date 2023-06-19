import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:ecowave/features/transaction/view/pages/paid_transaction_detail_page.dart';
import 'package:ecowave/features/transaction/view/pages/rating_page.dart';
import 'package:ecowave/features/transaction/view/widgets/empty_state.dart';
import 'package:ecowave/features/transaction/view/widgets/product_transaction_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessHistoryTransactionPage extends StatelessWidget {
  final Function moveTab;
  const SuccessHistoryTransactionPage({super.key, required this.moveTab});

  @override
  Widget build(BuildContext context) {
    context
        .read<HistoryTransactionBloc>()
        .add(const GetHistoryTransactionEvent());
    return BlocBuilder<HistoryTransactionBloc, HistoryTransactionState>(
        builder: (context, state) {
      debugPrint("state di selesai $state");
      if (state is HistoryTransactionLoading) {
        return const EcoLoading();
      } else if (state is HistoryTransactionFailed) {
        return EcoError(errorMessage: state.message, onRetry: () {});
      } else if (state is HistoryTransactionSuccess) {
        if (state.dataSuccess.isEmpty) {
          return const EmptyState();
        } else {
          return ListView.builder(
              itemCount: state.dataSuccess.length,
              itemBuilder: (BuildContext context, int index) {
                final HistoryTransactionModel cSuccess =
                    state.dataSuccess[index];
                return ProductTransactionWidget(
                  statusOrder: cSuccess.statusTransaction,
                  imageUrl: cSuccess.orderDetail[0].productImageUrl,
                  colorTextStatusOrder: AppColors.primary500,
                  productName: cSuccess.orderDetail[0].productName,
                  totalProductPrice: cSuccess.orderDetail[0].subTotalPrice,
                  totalProduct: cSuccess.orderDetail[0].qty,
                  totalProductOrder: cSuccess.orderDetail.length,
                  totalProductOrderPrice: cSuccess.totalPrice,
                  descriptionStatus:
                      "Pesanan berhasil, silahkan berikan penilaian Anda",
                  onPressedDetail: () {
                    context.push(
                        PaidTransactionDetailPage(detailTransaction: cSuccess));
                  },
                  onPressedAction: () {
                    context.push(RatingPage(
                      detailRating: cSuccess,
                      moveTab: moveTab,
                    ));
                  },
                  buttonName: "Berikan Penilaian",
                );
              });
        }
      } else {
        return const EmptyState();
      }
    });
  }
}
