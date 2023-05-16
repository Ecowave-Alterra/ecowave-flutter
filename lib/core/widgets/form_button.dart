part of 'package:ecowave/core.dart';

class EcoFormButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;

  const EcoFormButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      clipBehavior: Clip.none,
      onPressed: onPressed,
      child: Container(
        height: height ?? 40.0,
        width: width ?? 136.0,
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.green),
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor ?? Colors.red,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
