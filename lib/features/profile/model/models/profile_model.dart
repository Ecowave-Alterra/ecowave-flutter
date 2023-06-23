class UserProfileModel {
  final int id;
  final String? googleId;
  final String name;
  final String username;
  final String email;
  final String phone;
  final int point;
  final String profilePhotoUrl;
  final List<AddressModel>? addresses;

  UserProfileModel({
    required this.id,
    this.googleId,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.point,
    required this.profilePhotoUrl,
    this.addresses,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    var addressList = json['Data']['Addresses'] as List<dynamic>?;
    List<AddressModel> Addresses = addressList
            ?.map((address) => AddressModel.fromJson(address))
            .toList() ??
        [];

    return UserProfileModel(
      id: json['Data']['Id'],
      googleId: json['Data']['GoogleId'],
      name: json['Data']['Name'],
      username: json['Data']['Username'],
      email: json['Data']['Email'],
      phone: json['Data']['Phone'],
      point: json['Data']['Point'],
      profilePhotoUrl: json['Data']['ProfilePhoto'],
      addresses: Addresses,
    );
  }
}

class AddressModel {
  final int id;
  final String recipient;
  final String phone;
  final String provinceId;
  final String provinceName;
  final String cityId;
  final String cityName;
  final String address;
  final String note;
  final String mark;
  final bool isPrimary;

  AddressModel({
    required this.id,
    required this.recipient,
    required this.phone,
    required this.provinceId,
    required this.provinceName,
    required this.cityId,
    required this.cityName,
    required this.address,
    required this.note,
    required this.mark,
    required this.isPrimary,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['Id'],
      recipient: json['Recipient'],
      phone: json['Phone'],
      provinceId: json['ProvinceId'],
      provinceName: json['ProvinceName'],
      cityId: json['CityId'],
      cityName: json['CityName'],
      address: json['Address'],
      note: json['Note'],
      mark: json['Mark'],
      isPrimary: json['IsPrimary'],
    );
  }
}
