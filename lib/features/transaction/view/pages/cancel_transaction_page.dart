import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/bloc/tabbar/tabbar_bloc.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CancelTransactionPage extends StatefulWidget {
  final HistoryTransactionModel transaction;
  final Function moveTab;
  const CancelTransactionPage(
      {super.key, required this.moveTab, required this.transaction});

  @override
  State<CancelTransactionPage> createState() => _CancelTransactionPageState();
}

class _CancelTransactionPageState extends State<CancelTransactionPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _reasonController = TextEditingController();

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pesanan Saya"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              47.0.height,
              const Text(
                "Batalkan Pesanan",
                style:
                    TextStyle(fontWeight: AppFontWeight.medium, fontSize: 16),
              ),
              12.0.height,
              Card(
                color: AppColors.grey50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _reasonController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Pesan tidak boleh kosong";
                      }
                      return null;
                    },
                    cursorColor: AppColors.black,
                    textAlign: TextAlign.center,
                    maxLines: 8, //or null
                    decoration: const InputDecoration.collapsed(
                      hintText: "Tuliskan Alasan Kamu disini",
                    ),
                  ),
                ),
              ),
              26.0.height,
              ElevatedButton(
                onPressed: () {
                  if ((_formKey.currentState!.validate()) &&
                      (_reasonController.text.isNotEmpty)) {
                    showConfirmation(
                        title: 'Seriuss, kamu ingin membatalkan pesanan?',
                        message:
                            'Kami akan membatalkan pesanan kamu dengan permanen.',
                        nameButtonConfirmation: 'Batalkan',
                        colorButtonConfirmation: AppColors.error500,
                        pressNavConfirmation: () {
                          context.read<HistoryTransactionBloc>().add(
                              AddCancelTransactionCommentEvent(
                                  _reasonController.text,
                                  widget.transaction.transactionId));
                          context.popToRoot();
                          context.read<TabbarBloc>().add(4);
                          widget.moveTab();
                          "Pesanan berhasil dibatalkan".succeedBar(context);
                        },
                        context: context,
                        nameButtonUnConfirmation: 'Tidak');
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error500),
                child: const Text(
                  "Batalkan Pesanan",
                  style: TextStyle(color: AppColors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
