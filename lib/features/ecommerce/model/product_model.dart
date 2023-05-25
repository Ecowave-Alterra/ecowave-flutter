class ProductModel {
  final String namaBarang;
  final int harga;
  final String? stok;
  final String? bahan;
  final String? kategori;
  final String? deskripsiProduk;
  final String rateProduk;

  ProductModel({
    required this.namaBarang,
    required this.harga,
    this.stok,
    this.bahan,
    this.kategori,
    this.deskripsiProduk,
    required this.rateProduk,
  });
}
