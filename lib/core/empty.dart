import 'package:flutter/material.dart';

class EcoEmpty extends StatelessWidget {
  final String massage;
  final String image;

  const EcoEmpty({Key? key, required this.massage, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
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