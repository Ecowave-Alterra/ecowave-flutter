import 'package:ecowave/features/address/model/models/address_model.dart';
import 'package:ecowave/features/address/model/models/address_request.dart';
import 'package:ecowave/features/address/model/services/address_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'address_service_test.mocks.dart';

@GenerateMocks([AddressService])
void main() {
  group('address service ...', () {
    final AddressService addressService = MockAddressService();
    final List<AddressModel> addresses = [
      {
        "Id": 1,
        "Recipient": "ibu nadira",
        "PhoneNumber": "085123456789",
        "ProvinceId": 11,
        "ProvinceName": "Jawa Timur",
        "CityId": 31,
        "CityName": "Bangkalan",
        "Address": "bantul",
        "Note": "rumah warna oren",
        "Mark": "Rumah",
        "IsPrimary": false,
        "UserId": 5
      },
      {
        "Id": 2,
        "Recipient": "satpam kampus nadira",
        "PhoneNumber": "085123456789",
        "ProvinceId": 11,
        "ProvinceName": "Jawa Timur",
        "CityId": 42,
        "CityName": "Banyuwangi",
        "Address": "sleman",
        "Note": "titip ke satpam aja",
        "Mark": "Kantor",
        "IsPrimary": false,
        "UserId": 5
      },
      {
        "Id": 5,
        "Recipient": "bapak nadira",
        "PhoneNumber": "085123456789",
        "ProvinceId": 11,
        "ProvinceName": "Jawa Timur",
        "CityId": 51,
        "CityName": "Batu",
        "Address": "bantul",
        "Note": "rumah warna oren",
        "Mark": "Rumah",
        "IsPrimary": true,
        "UserId": 5
      }
    ].map((e) => AddressModel.fromJson(e)).toList();
    final AddressRequest addressRequest = AddressRequest(
      recipient: addresses[0].recipient,
      phoneNumber: addresses[0].phoneNumber,
      provinceId: addresses[0].provinceId,
      provinceName: addresses[0].provinceName,
      cityId: addresses[0].cityId,
      cityName: addresses[0].cityName,
      address: addresses[0].address,
    );

    test('get all addresses success', () async {
      when(addressService.getAddresses())
          .thenAnswer((realInvocation) async => addresses);

      final List<AddressModel> result = await addressService.getAddresses();
      expect(result, addresses);
    });

    test('create address success', () async {
      when(addressService.createAddresses(addressRequest))
          .thenAnswer((realInvocation) async => true);

      final bool result = await addressService.createAddresses(addressRequest);
      expect(result, true);
    });

    test('update address success', () async {
      when(addressService.updateAddresses(1, addressRequest))
          .thenAnswer((realInvocation) async => true);

      final bool result =
          await addressService.updateAddresses(1, addressRequest);
      expect(result, true);
    });
  });
}
