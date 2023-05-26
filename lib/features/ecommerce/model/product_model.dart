class ProductModel {
  final String productName;
  final int productPrice;
  final String? productStock;
  final String? productMaterial;
  final String? productCategory;
  final String? productDesc;
  final String productRate;

  ProductModel({
    required this.productName,
    required this.productPrice,
    this.productStock,
    this.productMaterial,
    this.productCategory,
    this.productDesc,
    required this.productRate,
  });
}
