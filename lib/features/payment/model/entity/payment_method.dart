class PaymentMethod {
  final String name;
  final String iconUrl;
  final List<String> instructions;

  PaymentMethod({
    required this.name,
    required this.iconUrl,
    required this.instructions,
  });
}
