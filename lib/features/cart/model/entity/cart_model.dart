class CartModel {
  int? id, price, totalItems;
  String? nameItems, detailItems, image;

  CartModel({
    this.id,
    this.price,
    this.totalItems,
    this.nameItems,
    this.detailItems,
    this.image,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      price: json['price'],
      totalItems: json['totalItems'],
      nameItems: json['nameItems'],
      detailItems: json['detailItems'],
      image: json['image'],
    );
  }
}
