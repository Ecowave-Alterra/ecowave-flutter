import 'package:ecowave/features/payment/model/models/transaction_model.dart';
import 'package:ecowave/features/payment/model/models/transaction_request.dart';
import 'package:ecowave/features/payment/model/services/transaction_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'transaction_service_test.mocks.dart';

@GenerateMocks([TransactionService])
void main() {
  group('transaction service ...', () {
    final TransactionService transactionService = MockTransactionService();
    final TransactionModel response = TransactionModel.fromJson({
      "Message": "Success Create Transaction",
      "Payment_url":
          "https://app.sandbox.midtrans.com/snap/v3/redirection/6590b4fb-21a3-45d7-aa0a-9e712d56dfcd",
      "Status": 201,
      "Transaction_Id": "eco22023061710010633"
    });

    final Map<String, dynamic> jsonMap = {
      "VoucherId": 1,
      "AddressId": 2,
      "TotalShippingPrice": 20000,
      "Point": 5000,
      "ExpeditionName": "Jalur Nugraha Ekakurir (JNE)",
      "EstimationDay": "3-6",
      "Discount": 10000,
      "TransactionDetails": [
        {
          "ProductId": "a3325f33-e01a-4e40-9ca7-5d84c4337094",
          "ProductName": "Product Name 1",
          "Qty": 1,
          "SubTotalPrice": 30000
        }
      ]
    };

    final TransactionRequest request = TransactionRequest(
      voucherId: jsonMap['VoucherId'],
      addressId: jsonMap['AddressId'],
      totalShippingPrice: jsonMap['TotalShippingPrice'],
      point: jsonMap['Point'],
      expeditionName: jsonMap['ExpeditionName'],
      estimationDay: jsonMap['EstimationDay'],
      discount: jsonMap['Discount'],
      transactionDetails: [],
    );

    test('checkout success', () async {
      when(transactionService.createTransaction(request))
          .thenAnswer((realInvocation) async => response);

      final TransactionModel result =
          await transactionService.createTransaction(request);
      expect(result, response);
    });

    test('get payment status success', () async {
      when(transactionService.getPaymentStatus("eco22023061514070654"))
          .thenAnswer((realInvocation) async => "settlemet");

      final String result =
          await transactionService.getPaymentStatus("eco22023061514070654");
      expect(result, "settlemet");
    });
  });
}
