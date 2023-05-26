import 'package:ecowave/features/order/model/delivery_model.dart';
import 'package:ecowave/features/order/model/order_product_model.dart';
import 'package:ecowave/features/order/model/payment_method_model.dart';
import 'package:ecowave/features/order/model/person_model.dart';
import 'package:ecowave/features/order/model/product_model.dart';
import 'package:ecowave/features/order/model/promo_model.dart';

class Checkout {
  final String? status;
  final Person? person;
  final String? infoOrder;
  final List<OrderProduct> order;
  final int totalOrderPrice;
  final Promo promo;
  final Delivery delivery;
  final PaymentMethod paymentMethod;

  Checkout({
    required this.person,
    required this.status,
    required this.order,
    required this.infoOrder,
    required this.totalOrderPrice,
    required this.promo,
    required this.delivery,
    required this.paymentMethod,
  });
}

final List<Checkout> checkoutUnpaid = [
  Checkout(
    person: Person(
        address: "Jl Asia Afrika  No 123 Kota Bandung 40526",
        name: "Shinta Rachma Shintia",
        noTelp: "(+62) 81123456789"),
    status: "Belum Bayar",
    order: [
      OrderProduct(
        totalProduct: 1,
        totalProductPrice: 5000,
        product: Product(
            imageUrl:
                "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop2.png",
            productName: "Totebag Tas belanja serbaguna"),
      ),
      OrderProduct(
        totalProduct: 3,
        totalProductPrice: 10000,
        product: Product(
            imageUrl:
                "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop6.png",
            productName: "Tas Hitam Solo"),
      ),
    ],
    infoOrder: "Belum Bayar oleh anda",
    promo: Promo(
        promoName: "Eco Jumat Berkah", promoCode: "ECOJUMAT", piece: 5000),
    delivery: Delivery(
        packageType: "Reguler",
        serviceName: "JNE",
        resiCode: "0123456789",
        shipping: 5000),
    paymentMethod: PaymentMethod(methodName: "OVO"),
    totalOrderPrice: 35000,
  ),
  Checkout(
      person: Person(
          address: "Jl Asia Afrika  No 123 Kota Bandung 40526",
          name: "Shinta Rachma Shintia",
          noTelp: "(+62) 81123456789"),
      status: "Belum Bayar",
      order: [
        OrderProduct(
          totalProduct: 2,
          totalProductPrice: 30000,
          product: Product(
              imageUrl:
                  "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop6.png",
              productName: "Tas Hitam Solo"),
        ),
        OrderProduct(
          totalProduct: 3,
          totalProductPrice: 10000,
          product: Product(
              imageUrl:
                  "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop2.png",
              productName: "Totebag Tas belanja serbaguna"),
        ),
        OrderProduct(
          totalProduct: 1,
          totalProductPrice: 20000,
          product: Product(
              imageUrl:
                  "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop5.png",
              productName: "Tas Putih sambalado"),
        ),
      ],
      infoOrder: "Belum Bayar oleh anda",
      totalOrderPrice: 130000,
      promo: Promo(promoName: "Eco Jumat Berkah", promoCode: "-", piece: 0),
      delivery: Delivery(
          packageType: "Reguler",
          serviceName: "JNE",
          resiCode: "0123456789",
          shipping: 20000),
      paymentMethod: PaymentMethod(methodName: "DANA")),
];

final List<Checkout> checkoutPacked = [
  Checkout(
    person: Person(
        address: "Jl Asia Afrika  No 123 Kota Bandung 40526",
        name: "Shinta Rachma Shintia",
        noTelp: "(+62) 81123456789"),
    status: "Dikemas",
    order: [
      OrderProduct(
        totalProduct: 1,
        totalProductPrice: 5000,
        product: Product(
            imageUrl:
                "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop2.png",
            productName: "Totebag Tas belanja serbaguna"),
      ),
      OrderProduct(
        totalProduct: 3,
        totalProductPrice: 10000,
        product: Product(
            imageUrl:
                "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop6.png",
            productName: "Tas Hitam Solo"),
      ),
    ],
    infoOrder: "Belum Bayar oleh anda",
    promo: Promo(
        promoName: "Eco Jumat Berkah", promoCode: "ECOJUMAT", piece: 5000),
    delivery: Delivery(
        packageType: "Reguler",
        serviceName: "JNE",
        resiCode: "0123456789",
        shipping: 5000),
    paymentMethod: PaymentMethod(methodName: "OVO"),
    totalOrderPrice: 35000,
  ),
];
