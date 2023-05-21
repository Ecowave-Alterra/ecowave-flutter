part of 'package:ecowave/core.dart';

class EcoFormButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final BoxBorder? border;
  final double? width;
  final double? height;

  const EcoFormButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.border,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.0,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(AppSizes.radiusButton),
        color: onPressed == null
            ? backgroundColor?.withOpacity(0.5) ?? AppColors.primary300
            : backgroundColor ?? AppColors.primary500,
      ),
      child: TextButton(
        onPressed: onPressed,
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
