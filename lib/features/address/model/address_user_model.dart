class AddressUser {
  String? name;
  String? telp;
  String? address;
  String? notes;
  String? place;

  AddressUser({
    required this.name,
    required this.telp,
    required this.address,
    this.notes,
    required this.place,
  });
}
