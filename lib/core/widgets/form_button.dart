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
          border: Border.all(color: borderColor ?? AppColors.primary500),
          borderRadius: BorderRadius.circular(AppSizes.radiusButton),
          color: backgroundColor ?? AppColors.primary500,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: textColor ?? AppColors.white,
              fontWeight: AppFontWeight.semibold,
              fontSize: AppSizes.buttonFontSize,
            ),
          ),
        ),
      ),
    );
  }
}
