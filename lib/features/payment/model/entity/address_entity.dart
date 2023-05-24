class AddressEntity {
  final String name;
  final String phoneNumber;
  final String address;
  final String markedAs;
  final String? note;
  final bool isMain;

  AddressEntity({
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.markedAs,
    this.note,
    this.isMain = false,
  });
}
