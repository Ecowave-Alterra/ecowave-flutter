import 'dart:convert';

class CartModel {
  final String id;
  final String nameItems;
  final String detailItems;
  final String image;
  final int price;
  int totalItems;
  bool checkedItems;
  CartModel({
    required this.id,
    required this.nameItems,
    required this.detailItems,
    required this.image,
    required this.price,
    required this.totalItems,
    required this.checkedItems,
  });

  int get totalPrice => price * totalItems;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameItems': nameItems,
      'detailItems': detailItems,
      'image': image,
      'price': price,
      'totalItems': totalItems,
      'checkedItems': checkedItems,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] ?? '',
      nameItems: map['nameItems'] ?? '',
      detailItems: map['detailItems'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? 0,
      totalItems: map['totalItems']?.toInt() ?? 0,
      checkedItems: map['checkedItems'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));

  CartModel copyWith({
    String? id,
    String? nameItems,
    String? detailItems,
    String? image,
    int? price,
    int? totalItems,
    bool? checkedItems,
  }) {
    return CartModel(
      id: id ?? this.id,
      nameItems: nameItems ?? this.nameItems,
      detailItems: detailItems ?? this.detailItems,
      image: image ?? this.image,
      price: price ?? this.price,
      totalItems: totalItems ?? this.totalItems,
      checkedItems: checkedItems ?? this.checkedItems,
    );
  }

  @override
  String toString() {
    return 'CartModel(id: $id, nameItems: $nameItems, detailItems: $detailItems, image: $image, price: $price, totalItems: $totalItems, checkedItems: $checkedItems)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartModel &&
        other.id == id &&
        other.nameItems == nameItems &&
        other.detailItems == detailItems &&
        other.image == image &&
        other.price == price &&
        other.totalItems == totalItems &&
        other.checkedItems == checkedItems;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nameItems.hashCode ^
        detailItems.hashCode ^
        image.hashCode ^
        price.hashCode ^
        totalItems.hashCode ^
        checkedItems.hashCode;
  }
}
