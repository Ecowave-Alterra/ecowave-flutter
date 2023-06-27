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
        .add(const GetHistorySuccessTransactionEvent());
    return BlocConsumer<HistoryTransactionBloc, HistoryTransactionState>(
        listener: (context, state) {
      if (state is HistorySuccessTransactionSuccess) {
        if (state.isUpdated) {
          state.messageUpdated.succeedBar(context);
        }
      }
    }, builder: (context, state) {
      if (state is HistoryTransactionLoading) {
        return const EcoLoading();
      }
      if (state is HistoryTransactionEmpty) {
        return const EmptyState();
      } else if (state is HistoryTransactionFailed) {
        return EcoError(
            errorMessage: state.message,
            onRetry: () {
              context
                  .read<HistoryTransactionBloc>()
                  .add(const GetHistoryFailedTransactionEvent());
            });
      } else if (state is HistorySuccessTransactionSuccess) {
        if (state.dataSuccess.isEmpty) {
          return const EmptyState();
        } else if (state.isUpdated) {
          return const EcoLoading();
        } else {
          return ListView.builder(
              itemCount: state.dataSuccess.length,
              itemBuilder: (BuildContext context, int index) {
                final HistoryTransactionModel cSuccess =
                    state.dataSuccess[state.dataSuccess.length - 1 - index];
                return ProductTransactionWidget(
                  statusOrder: cSuccess.statusTransaction,
                  imageUrl: cSuccess.orderDetail[0].productImageUrl,
                  colorTextStatusOrder: AppColors.primary500,
                  productName: cSuccess.orderDetail[0].productName,
                  totalProductPrice: cSuccess.orderDetail[0].subTotalPrice,
                  totalProduct: cSuccess.orderDetail[0].qty,
                  totalProductOrder: cSuccess.orderDetail.length,
                  totalProductOrderPrice: cSuccess.totalPrice,
                  descriptionStatus: cSuccess.expeditionRating > 0.0
                      ? "Terima kasih sudah belanja di toko kami😁"
                      : "Pesanan telah berhasil, silahkan berikan penilaian Anda",
                  onPressedDetail: () {
                    context.push(
                        PaidTransactionDetailPage(detailTransaction: cSuccess));
                  },
                  onPressedAction: () {
                    cSuccess.expeditionRating > 0.0
                        ? null
                        : context.push(RatingPage(
                            detailRating: cSuccess,
                            moveTab: moveTab,
                          ));
                  },
                  buttonName: cSuccess.expeditionRating > 0.0
                      ? "Pesanan Selesai"
                      : "Berikan Penilaian",
                  colorBackgroundButton: cSuccess.expeditionRating > 0.0
                      ? AppColors.primary50
                      : AppColors.primary500,
                  colorTextButton: cSuccess.expeditionRating > 0.0
                      ? AppColors.primary300
                      : AppColors.white,
                );
              });
        }
      } else {
        return const EmptyState();
      }
    });
  }
}
