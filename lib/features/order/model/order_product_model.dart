import 'package:ecowave/features/order/model/product_model.dart';

class OrderProduct {
  final Product product;
  final int? totalProduct;
  final int? totalProductPrice;

  OrderProduct({
    required this.totalProduct,
    required this.totalProductPrice,
    required this.product,
  });
}
