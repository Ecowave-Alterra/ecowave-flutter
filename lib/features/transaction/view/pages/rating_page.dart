import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecowave/core.dart';
import 'package:ecowave/features/transaction/bloc/history_transaction/history_transaction_bloc.dart';
import 'package:ecowave/features/transaction/bloc/tabbar/tabbar_bloc.dart';
import 'package:ecowave/features/transaction/model/models/history_transaction_model.dart';
import 'package:ecowave/features/transaction/model/models/rating_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:file_picker/file_picker.dart';

class RatingPage extends StatefulWidget {
  final Function moveTab;
  final HistoryTransactionModel detailRating;
  const RatingPage(
      {super.key, required this.detailRating, required this.moveTab});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final GlobalKey<FormState> _formKeyController = GlobalKey<FormState>();
  final TextEditingController _rateLayananController = TextEditingController();
  final List<TextEditingController> _rateProdukControllers = [];
  final List<TextEditingController> _fotoControllers = [];
  final List<TextEditingController> _videoControllers = [];
  final List<TextEditingController> _komenControllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.detailRating.orderDetail.length; i++) {
      _rateProdukControllers.add(TextEditingController());
      _fotoControllers.add(TextEditingController());
      _videoControllers.add(TextEditingController());
      _komenControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in _rateProdukControllers) {
      controller.dispose();
    }
    for (var controller in _fotoControllers) {
      controller.dispose();
    }
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    for (var controller in _komenControllers) {
      controller.dispose();
    }

    _rateLayananController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nilai Produk"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKeyController,
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
                Container(
                    decoration: const BoxDecoration(),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.detailRating.orderDetail.length,
                      itemBuilder: (context, index) {
                        final OrderDetail product =
                            widget.detailRating.orderDetail[index];
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _sizedContainer(
                                  CachedNetworkImage(
                                    imageUrl: product.productImageUrl,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(
                                      color: Colors.green,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                50.0.width,
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        product.productName,
                                        textAlign: TextAlign.right,
                                      ),
                                      Container(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            20.0.height,
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
                                allowHalfRating: false,
                                itemCount: 5,
                                itemSize: 25.0,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                itemBuilder: (context, _) => const ImageIcon(
                                  AppIcons.solidUlasan,
                                  color: AppColors.warning500,
                                ),
                                onRatingUpdate: (rating) {
                                  _rateProdukControllers[index].text =
                                      rating.toString();
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
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const ImageIcon(AppIcons.foto,
                                              color: AppColors.primary500),
                                          const SizedBox(height: 15.0),
                                          TextFormField(
                                            controller: _fotoControllers[index],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: AppColors.primary500),
                                            decoration: const InputDecoration(
                                              hintText: "Tambah Foto",
                                              hintStyle: TextStyle(
                                                  color: AppColors.primary500),
                                              border: InputBorder.none,
                                            ),
                                            readOnly: true,
                                            onTap: () async {
                                              uploadImage(index);
                                            },
                                          ),
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
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18, vertical: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const ImageIcon(AppIcons.video,
                                              color: AppColors.primary500),
                                          const SizedBox(height: 15.0),
                                          TextFormField(
                                            controller:
                                                _videoControllers[index],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                color: AppColors.primary500),
                                            decoration: const InputDecoration(
                                              hintText: "Tambah Video",
                                              hintStyle: TextStyle(
                                                  color: AppColors.primary500),
                                              border: InputBorder.none,
                                            ),
                                            readOnly: true,
                                            onTap: () async {
                                              uploadVideo(index);
                                            },
                                          ),
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
                                    controller: _komenControllers[index],
                                    cursorColor: AppColors.black,
                                    textAlign: TextAlign.center,
                                    maxLines: 8,
                                    decoration: const InputDecoration.collapsed(
                                        hintText:
                                            "Tuliskan Komentar Anda disini"),
                                  ),
                                )),
                            20.0.height,
                            const Divider(),
                            20.0.height,
                          ],
                        );
                      },
                    )),
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
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 25.0,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (context, _) => const ImageIcon(
                      AppIcons.solidUlasan,
                      color: AppColors.warning500,
                    ),
                    onRatingUpdate: (rating) {
                      _rateLayananController.text = rating.toString();
                    },
                  ),
                ),
                36.0.height,
                ElevatedButton(
                  onPressed: () {
                    showConfirmation(
                        title: 'Apakah penilaianmu sudah benar?',
                        message:
                            'Kami akan memasukkan penilaian ini ke data kami',
                        nameButtonConfirmation: 'Nilai',
                        colorButtonConfirmation: AppColors.primary500,
                        pressNavConfirmation: () {
                          List<RatingData> ratingDataList = [];

                          for (int i = 0;
                              i < widget.detailRating.orderDetail.length;
                              i++) {
                            // Retrieve the necessary data for each rating item
                            double ratingProduct = double.tryParse(
                                    _rateProdukControllers[i].text) ??
                                1.0;
                            String? photoUrl = _fotoControllers[i].text;
                            String? videoUrl = _videoControllers[i].text;
                            String? comment = _komenControllers[i].text;

                            RatingData ratingData = RatingData(
                              ratingProduct: ratingProduct,
                              photoUrl: photoUrl,
                              videoUrl: videoUrl,
                              comment: comment,
                            );
                            ratingDataList.add(ratingData);
                          }

                          double expeditionRating =
                              double.tryParse(_rateLayananController.text) ??
                                  1.0;

                          context.read<HistoryTransactionBloc>().add(
                              PostRatingDataEvent(
                                  ratingDataList: ratingDataList,
                                  expeditionRating: expeditionRating,
                                  transactionId:
                                      widget.detailRating.transactionId));

                          showPoint(
                              nilaiPoint: 10,
                              context: context,
                              onPress: () {
                                context.popToRoot();
                                context.read<TabbarBloc>().add((0));
                                widget.moveTab();
                              });
                        },
                        context: context,
                        nameButtonUnConfirmation: 'Tidak');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary500),
                  child: const Text(
                    "Kirim Komentar",
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
                20.0.height,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sizedContainer(Widget child) {
    return SizedBox(
      width: 90.0,
      height: 70.0,
      child: Center(child: child),
    );
  }

  void uploadImage(index) async {
    final selectImage = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (selectImage != null) {
      final FilePickerResult result = selectImage;

      if (result.files.isNotEmpty) {
        final PlatformFile file = result.files.first;
        final String filePath = file.path ?? "";

        String extension = filePath.split('.').last.toLowerCase();
        if (extension != 'jpg' && extension != 'jpeg' && extension != 'png') {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content:
                    Text("Masukkan gambar yang bertipe jpg, jpeg, atau png"),
              ),
            );
          }

          setState(() {
            _fotoControllers[index].text = "";
          });
        } else {
          setState(() {
            _fotoControllers[index].text = filePath.toString();
          });
        }
      }
    } else {
      setState(() {
        _fotoControllers[index].text = "";
      });
    }
  }

  void uploadVideo(index) async {
    final selectVideo = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'mp4',
      ],
    );

    if (selectVideo != null) {
      final FilePickerResult result = selectVideo;

      if (result.files.isNotEmpty) {
        final PlatformFile file = result.files.first;
        final String filePath = file.path ?? "";

        String extension = filePath.split('.').last.toLowerCase();
        if (extension != 'mp4') {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Masukkan Video yang bertipe mp4"),
              ),
            );
          }

          setState(() {
            _videoControllers[index].text = "";
          });
        } else {
          setState(() {
            _videoControllers[index].text = filePath.toString();
          });
        }
      }
    } else {
      setState(() {
        _videoControllers[index].text = "";
      });
    }
  }
}
