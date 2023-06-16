import 'package:ecowave/features/payment/model/models/voucher_model.dart';
import 'package:ecowave/features/payment/model/services/voucher_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'voucher_service_test.mocks.dart';

@GenerateMocks([VoucherService])
void main() {
  group('voucher service ...', () {
    final VoucherService voucherService = MockVoucherService();
    final List<VoucherModel> vouchers = [
      {
        "Id": 2,
        "startDate": "2023-06-21T07:00:00+07:00",
        "endDate": "2023-07-21T07:00:00+07:00",
        "minimumPurchase": 0,
        "maximumDiscount": 0,
        "discountPercent": 0,
        "claimableCount": 1000,
        "maxClaimLimit": 3,
        "voucherTypeID": 1,
        "VoucherType": {
          "type": "Gratis Ongkir",
          "photoURL":
              "https://storage.cloud.google.com/ecowave_storage/img/Sample.png"
        }
      }
    ].map((e) => VoucherModel.fromJson(e)).toList();

    test('get all vouchers success', () async {
      when(voucherService.getVouchers())
          .thenAnswer((realInvocation) async => vouchers);

      final List<VoucherModel> result = await voucherService.getVouchers();
      expect(result, vouchers);
    });
  });
}
