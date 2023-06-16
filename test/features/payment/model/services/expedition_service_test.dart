import 'package:ecowave/features/payment/model/models/expedition_model.dart';
import 'package:ecowave/features/payment/model/models/expedition_request.dart';
import 'package:ecowave/features/payment/model/models/expedition_response_model.dart';
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
        "rajaongkir": {
          "results": [
            {
              "Code": "pos",
              "name": "POS Indonesia (POS)",
              "costs": [
                {
                  "service": "Pos Reguler",
                  "description": "Pos Reguler",
                  "cost": [
                    {"value": 48000, "etd": "7 HARI"}
                  ]
                }
              ]
            }
          ]
        }
      },
    ]
        .map((e) => ExpeditionResponseModel.fromJson(e))
        .toList()
        .map((e) => e.toModelEntity())
        .toList();
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
