import 'package:ecowave/features/payment/model/services/get_point_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_point_service_test.mocks.dart';

@GenerateMocks([GetPointService])
void main() {
  group('get point service ...', () {
    final GetPointService getPointService = MockGetPointService();

    test('get point success', () async {
      when(getPointService.getPoint()).thenAnswer((realInvocation) async => 15);

      final int result = await getPointService.getPoint();
      expect(result, 15);
    });
  });
}
