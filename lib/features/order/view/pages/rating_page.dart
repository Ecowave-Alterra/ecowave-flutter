import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nilai Produk"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 11,
              ),
              const Text(
                "Puas dengan pesananmu?",
                style: TextStyle(fontWeight: AppFontWeight.semibold),
              ),
              const Text(
                "Berikan Rating sekarang juga untuk mendapatkan point!",
                textAlign: TextAlign.center,
              ),
              20.0.height,
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Layanan Pengiriman")),
              20.0.height,
              Container(
                decoration: const BoxDecoration(),
                child: RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25.0,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // print(rating);
                  },
                ),
              ),
              50.0.height,
              const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Kualitas Produk")),
              20.0.height,
              Container(
                decoration: const BoxDecoration(),
                child: RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 25.0,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    // print(rating);
                  },
                ),
              ),
              60.0.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.grey50,
                          border: Border.all(
                            color: AppColors.primary500,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ImageIcon(AppIcons.foto,
                                color: AppColors.primary500),
                            15.0.height,
                            const Text(
                              "Tambah Foto",
                              textAlign: TextAlign.justify,
                              style: TextStyle(color: AppColors.primary500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  10.0.width,
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.grey50,
                          border: Border.all(
                            color: AppColors.primary500,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const ImageIcon(
                              AppIcons.video,
                              color: AppColors.primary500,
                            ),
                            15.0.height,
                            const Text(
                              "Tambah Video",
                              textAlign: TextAlign.justify,
                              style: TextStyle(color: AppColors.primary500),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              28.0.height,
              Container(
                  color: AppColors.grey50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: AppColors.black,
                      textAlign: TextAlign.center,
                      maxLines: 8,
                      decoration: const InputDecoration.collapsed(
                          hintText: "Tuliskan Komentar Anda disini"),
                    ),
                  )),
              16.0.height,
              ElevatedButton(
                onPressed: () {
                  showPoint(context: context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary500),
                child: const Text(
                  "Kirim Komentar",
                  style: TextStyle(color: AppColors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
