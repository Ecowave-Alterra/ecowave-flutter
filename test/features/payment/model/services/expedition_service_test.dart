import 'package:ecowave/features/payment/model/models/expedition_model.dart';
import 'package:ecowave/features/payment/model/models/expedition_request.dart';
import 'package:ecowave/features/payment/model/services/expedition_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'expedition_service_test.mocks.dart';

@GenerateMocks([ExpeditionService])
void main() {
  group('expedition service ...', () {
    final ExpeditionService expeditionService = MockExpeditionService();
    final List<ExpeditionModel> expeditions = [
      {
        "Code": "jne",
        "Name": "Jalur Nugraha Ekakurir (JNE)",
        "Service": "REG",
        "Description": "Layanan Reguler",
        "Value": 66000,
        "Etd": "2-3"
      },
      {
        "Code": "pos",
        "Name": "POS Indonesia (POS)",
        "Service": "Pos Reguler",
        "Description": "Pos Reguler",
        "Value": 48000,
        "Etd": "7 HARI"
      },
      {
        "Code": "tiki",
        "Name": "Citra Van Titipan Kilat (TIKI)",
        "Service": "REG",
        "Description": "Regular Service",
        "Value": 42000,
        "Etd": "3"
      }
    ].map((e) => ExpeditionModel.fromJson(e)).toList();
    final ExpeditionRequest request =
        ExpeditionRequest(cityId: "12", weight: 1);

    test('get all shipping options success', () async {
      when(expeditionService.getExpeditions(request))
          .thenAnswer((realInvocation) async => expeditions);

      final List<ExpeditionModel> result =
          await expeditionService.getExpeditions(request);
      expect(result, expeditions);
    });
  });
}
