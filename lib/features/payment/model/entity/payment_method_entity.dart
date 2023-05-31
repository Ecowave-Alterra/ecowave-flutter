class PaymentMethodEntity {
  final String name;
  final String iconUrl;
  final String type;
  final List<String> instructions;

  PaymentMethodEntity({
    required this.name,
    required this.iconUrl,
    required this.type,
    required this.instructions,
  });
}

class PaymentMethodType {
  static const String eWallet = "E-Wallet";
  static const String bankTransfer = "Transfer Bank";
}
