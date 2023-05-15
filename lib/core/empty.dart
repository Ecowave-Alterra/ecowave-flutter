import 'package:flutter/material.dart';

class EcoEmpty extends StatelessWidget {
  final String massage;
  final String gambar;

  const EcoEmpty({Key? key, required this.massage, required this.gambar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(gambar),
        ),
        const SizedBox(height: 16.0),
        Text(
          massage,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}