import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

class TrackDeliveryPage extends StatefulWidget {
  const TrackDeliveryPage({super.key});

  @override
  State<TrackDeliveryPage> createState() => _TrackDeliveryPageState();
}

class _TrackDeliveryPageState extends State<TrackDeliveryPage> {
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lacak Pesanan"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.0.height,
            const Text(
              "Pesanan sedang dalam pengiriman",
              style: TextStyle(fontWeight: AppFontWeight.medium),
            ),
            14.0.height,
            const Row(
              children: [
                ImageIcon(AppIcons.pengiriman),
                SizedBox(
                  width: 9,
                ),
                Text("Estimasi diterima tanggal : 28 Apr 2023")
              ],
            ),
            30.0.height,
            const Text("Reguler"),
            6.0.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("JNE Express : 21372563213"),
                Row(
                  children: [
                    Tooltip(
                      key: tooltipkey,
                      triggerMode: TooltipTriggerMode.manual,
                      showDuration: const Duration(seconds: 1),
                      message: 'Text Copied',
                    ),
                    InkWell(
                      onTap: () {
                        tooltipkey.currentState?.ensureTooltipVisible();
                      },
                      child: const Text(
                        'Salin',
                        style: TextStyle(color: AppColors.primary400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            32.0.height,
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 28),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("28 Apr 2023"),
                        Container(
                          width: 100,
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: const Text(
                              "pesanan sedang dalam perjalanan ke alamat tujuan",
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "28 Apr 2023",
                        style: TextStyle(color: AppColors.grey300),
                      ),
                      Container(
                        width: 100,
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: const Text(
                            "Pesanan sedang dikirim",
                            textAlign: TextAlign.justify,
                            style: TextStyle(color: AppColors.grey300),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
