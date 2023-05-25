part of 'package:ecowave/core.dart';

class EcoEmpty extends StatelessWidget {
  final String massage;
  final String image;
  final double height;

  const EcoEmpty(
      {Key? key,
      required this.massage,
      required this.image,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
          height: height,
        ),
        const SizedBox(height: AppSizes.primary),
        Text(
          massage,
          style: const TextStyle(
            fontSize: AppSizes.secondary,
            color: AppColors.grey500,
          ),
        ),
      ],
    );
  }
}
