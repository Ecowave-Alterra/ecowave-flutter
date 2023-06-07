import 'package:ecowave/features/transaction/model/models/history_transaction.dart';

class HistoryTransactionService {
  // late Dio _dio;
  // AddressRemoteDatasourceImpl() {
  //   _dio = Dio();
  // }

  List dummy = [
    {
      "transaction_id": "1",
      "recipient": "Anton",
      "address": "Jln. Anggrek no 7, Jakarta",
      "phone": "08139212987",
      "note": "Taruh di Sumurrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr",
      "status_transaction": "Belum Dibayar",
      "total_price": 80000,
      "created_at": "2023-08-02T19:00:00Z",
      "shipping": 15000,
      "voucher": 8000,
      "payment_method": "DANA",
      "expedition": "JNT",
      "resi_code": "222222222",
      "type_delivery": "Reguler",
      "description_transaction":
          "Silahkan melakukan pembayaran agar pesanan segera di proses",
      "productTransaction": [
        {
          "product_id": 1,
          "product_name":
              "Tas Totebag Hitam Serbagunaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "qty": 2,
          "price": 20000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop6.png"
        },
        {
          "product_id": 2,
          "product_name": "Tas Totebag Putih Serbaguna",
          "qty": 3,
          "price": 15000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop2.png"
        },
        {
          "product_id": 3,
          "product_name": "Sendok Masyarakat",
          "qty": 5,
          "price": 11400,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop3.png"
        }
      ],
      "tracking_expedition": [
        {
          "tracking_expedition_id": 1,
          "delivery_date": "2023-09-30T11:00:00Z",
          "description": "pesanan sedang dalam perjalanan ke alamat tujuan"
        },
        {
          "tracking_expedition_id": 2,
          "delivery_date": "2023-08-30T11:00:00Z",
          "description": "Pesanan sudah sampai di kota tujuan"
        },
        {
          "tracking_expedition_id": 3,
          "delivery_date": "2023-07-30T11:00:00Z",
          "description": "Pesanan sedang dikemas"
        }
      ],
      "estimate_received": "2023-09-30T11:00:00Z"
    },
    {
      "transaction_id": "2",
      "recipient": "Anton",
      "address": "Jln. Anggrek no 7, Jakarta",
      "phone": "08139212987",
      "note": "bisa taruh depan pintu saja",
      "status_transaction": "Belum Dibayar",
      "total_price": 116000,
      "created_at": "2023-05-30T11:00:00Z",
      "shipping": 15000,
      "voucher": 8000,
      "payment_method": "DANA",
      "expedition": "JNE",
      "resi_code": "11111111111",
      "type_delivery": "Hemat",
      "description_transaction":
          "Silahkan melakukan pembayaran agar pesanan segera di proses",
      "productTransaction": [
        {
          "product_id": 1,
          "product_name": "Tas Coklat Fuin",
          "qty": 4,
          "price": 15000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop7.png"
        },
        {
          "product_id": 2,
          "product_name": "Tas Totebag Putih Serbaguna",
          "qty": 1,
          "price": 15000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop2.png"
        }
      ],
      "tracking_expedition": [
        {
          "tracking_expedition_id": 1,
          "delivery_date": "2023-09-30T11:00:00Z",
          "description": "pesanan sedang dalam perjalanan ke alamat tujuan"
        },
        {
          "tracking_expedition_id": 2,
          "delivery_date": "2023-08-30T11:00:00Z",
          "description": "Pesanan sudah sampai di kota tujuan"
        },
        {
          "tracking_expedition_id": 3,
          "delivery_date": "2023-07-30T11:00:00Z",
          "description": "Pesanan sedang dikemas"
        }
      ],
      "estimate_received": "2023-09-30T11:00:00Z"
    },
    {
      "transaction_id": "3",
      "recipient": "Anton",
      "address": "Jln. Anggrek no 7, Jakarta",
      "phone": "08139212987",
      "note": "-",
      "status_transaction": "Selesai",
      "total_price": 770000,
      "created_at": "2023-05-30T11:00:00Z",
      "shipping": 15000,
      "voucher": 8000,
      "payment_method": "DANA",
      "expedition": "TIKI",
      "resi_code": "3333333333",
      "type_delivery": "Kargo",
      "description_transaction":
          "Silahkan melakukan pembayaran agar pesanan segera di proses",
      "productTransaction": [
        {
          "product_id": 1,
          "product_name": "Tupperware Ajaib",
          "qty": 9,
          "price": 920000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop1.png"
        },
        {
          "product_id": 2,
          "product_name": "Tas Totebag Putih Serbaguna",
          "qty": 7,
          "price": 15000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop2.png"
        }
      ],
      "tracking_expedition": [
        {
          "tracking_expedition_id": 1,
          "delivery_date": "2023-07-30T11:00:00Z",
          "description": "Pesanan sedang dikemas"
        },
        {
          "tracking_expedition_id": 2,
          "delivery_date": "2023-08-30T11:00:00Z",
          "description": "pesanan sedang dalam perjalanan ke alamat tujuan"
        },
        {
          "tracking_expedition_id": 3,
          "delivery_date": "2023-09-30T11:00:00Z",
          "description": "Pesanan sudah sampai di kota tujuan"
        }
      ],
      "estimate_received": "2023-09-30T11:00:00Z"
    },
    {
      "transaction_id": "4",
      "recipient": "Anton",
      "address": "Jln. Anggrek no 7, Jakarta",
      "phone": "08139212987",
      "note": "Taruh di Teras",
      "status_transaction": "Sedang Dikirim",
      "total_price": 320000,
      "created_at": "2023-05-30T11:00:00Z",
      "shipping": 10000,
      "voucher": 4000,
      "payment_method": "GOPAY",
      "expedition": "SICEPAT",
      "resi_code": "44444444",
      "type_delivery": "Mulus",
      "description_transaction":
          "Silahkan melakukan pembayaran agar pesanan segera di proses",
      "productTransaction": [
        {
          "product_id": 2,
          "product_name": "Tas Totebag Putih Serbaguna",
          "qty": 7,
          "price": 15000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop2.png"
        },
        {
          "product_id": 1,
          "product_name": "Tas Totebag Hitam Serbaguna",
          "qty": 10,
          "price": 20000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop6.png"
        },
      ],
      "tracking_expedition": [
        {
          "tracking_expedition_id": 1,
          "delivery_date": "2023-07-30T11:00:00Z",
          "description": "Pesanan sedang dikemas"
        },
        {
          "tracking_expedition_id": 2,
          "delivery_date": "2023-08-30T11:00:00Z",
          "description": "pesanan sedang dalam perjalanan ke alamat tujuan"
        },
      ],
      "estimate_received": "2023-04-30T11:00:00Z"
    },
    {
      "transaction_id": "4",
      "recipient": "Anton",
      "address": "Jln. Anggrek no 7, Jakarta",
      "phone": "08139212987",
      "note": "GAK ADA",
      "status_transaction": "Sedang Dikemas",
      "total_price": 7540000,
      "created_at": "2023-05-30T11:00:00Z",
      "shipping": 10000,
      "voucher": 4000,
      "payment_method": "SHOPEEPAY",
      "expedition": "JNE",
      "resi_code": "Belum Ada",
      "type_delivery": "Reguler",
      "description_transaction":
          "Silahkan melakukan pembayaran agar pesanan segera di proses",
      "productTransaction": [
        {
          "product_id": 2,
          "product_name": "Tempat Sampah Moedern",
          "qty": 7,
          "price": 15000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop4.png"
        },
        {
          "product_id": 1,
          "product_name": "Tas Totebag Hitam Serbaguna",
          "qty": 5,
          "price": 110000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop6.png"
        },
      ],
      "tracking_expedition": [
        {
          "tracking_expedition_id": 3,
          "delivery_date": "2023-07-30T11:00:00Z",
          "description": "Pesanan sedang dikemas"
        }
      ],
      "estimate_received": "2023-09-30T11:00:00Z"
    },
    {
      "transaction_id": "4",
      "recipient": "Anton",
      "address": "Jln. Anggrek no 7, Jakarta",
      "phone": "08139212987",
      "note": "Kasih ke Tetangga",
      "status_transaction": "Dibatalkan",
      "total_price": 11111000,
      "created_at": "2023-05-30T11:00:00Z",
      "shipping": 330000,
      "voucher": 4000,
      "payment_method": "ShopeePay",
      "expedition": "SIcepat",
      "resi_code": "66666666",
      "type_delivery": "Kargo",
      "description_transaction":
          "Silahkan melakukan pembayaran agar pesanan segera di proses",
      "productTransaction": [
        {
          "product_id": 1,
          "product_name": "Tas Totebag Putih Kinc",
          "qty": 55,
          "price": 5550000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop5.png"
        },
        {
          "product_id": 2,
          "product_name": "Tas Totebag Putih Serbaguna",
          "qty": 7,
          "price": 15000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop2.png"
        }
      ],
      "tracking_expedition": [],
      "estimate_received": "2023-09-30T11:00:00Z"
    },
    {
      "transaction_id": "4",
      "recipient": "Anton",
      "address": "Jln. Anggrek no 7, Jakarta",
      "phone": "08139212987",
      "note": "Kasih ke Tetangga",
      "status_transaction": "Belum Dibayar",
      "total_price": 11111000,
      "created_at": "2023-05-30T11:00:00Z",
      "shipping": 330000,
      "voucher": 4000,
      "payment_method": "ShopeePay",
      "expedition": "Express",
      "resi_code": "7777777",
      "type_delivery": "Hemat",
      "description_transaction":
          "Silahkan melakukan pembayaran agar pesanan segera di proses",
      "productTransaction": [
        {
          "product_id": 1,
          "product_name": "Tas Totebag Putih Kinc",
          "qty": 55,
          "price": 5550000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop5.png"
        },
        {
          "product_id": 2,
          "product_name": "Tas Totebag Putih Serbaguna",
          "qty": 7,
          "price": 15000,
          "product_image_url":
              "https://raw.githubusercontent.com/Ecowave-Alterra/ecowave-flutter/main/assets/images/productShop2.png"
        }
      ],
      "tracking_expedition": [
        {
          "tracking_expedition_id": 1,
          "delivery_date": "2023-09-30T11:00:00Z",
          "description": "pesanan sedang dalam perjalanan ke alamat tujuan"
        },
        {
          "tracking_expedition_id": 2,
          "delivery_date": "2023-08-30T11:00:00Z",
          "description": "Pesanan sudah sampai di kota tujuan"
        },
        {
          "tracking_expedition_id": 3,
          "delivery_date": "2023-07-30T11:00:00Z",
          "description": "Pesanan sedang dikemas"
        }
      ],
      "estimate_received": "2023-09-30T11:00:00Z"
    }
  ];

  Future<List<HistoryTransactionModel>> getAllHistoryTransaction() async {
    // const String url = '';
    // final response = await _dio.get(url);

    return dummy.map((e) => HistoryTransactionModel.fromJson(e)).toList();
  }

  Future<List<HistoryTransactionModel>> getAllHistoryTransactionUnpaid() async {
    // const String url = '';
    // final response = await _dio.get(url);

    return dummy
        .map((e) => HistoryTransactionModel.fromJson(e))
        .where((element) => element.statusTransaction == "Belum Dibayar")
        .toList();
  }

  Future<List<HistoryTransactionModel>> getAllHistoryTransactionPacked() async {
    // const String url = '';
    // final response = await _dio.get(url);

    return dummy
        .map((e) => HistoryTransactionModel.fromJson(e))
        .where((element) => element.statusTransaction == "Sedang Dikemas")
        .toList();
  }

  Future<List<HistoryTransactionModel>>
      getAllHistoryTransactionSending() async {
    // const String url = '';
    // final response = await _dio.get(url);

    return dummy
        .map((e) => HistoryTransactionModel.fromJson(e))
        .where((element) => element.statusTransaction == "Sedang Dikirim")
        .toList();
  }

  Future<List<HistoryTransactionModel>>
      getAllHistoryTransactionSuccess() async {
    // const String url = '';
    // final response = await _dio.get(url);

    return dummy
        .map((e) => HistoryTransactionModel.fromJson(e))
        .where((element) => element.statusTransaction == "Selesai")
        .toList();
  }

  Future<List<HistoryTransactionModel>> getAllHistoryTransactionFailed() async {
    // const String url = '';
    // final response = await _dio.get(url);

    return dummy
        .map((e) => HistoryTransactionModel.fromJson(e))
        .where((element) => element.statusTransaction == "Dibatalkan")
        .toList();
  }
}
