import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

class CheckoutSettingButton extends StatelessWidget {
  final String? value;
  final String label;
  final VoidCallback onPressed;

  const CheckoutSettingButton({
    super.key,
    this.value,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.primary, vertical: 16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.grey300.withOpacity(0.5),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value ?? label,
              style: TextStyle(
                fontWeight: value == null
                    ? AppFontWeight.regular
                    : AppFontWeight.semibold,
              ),
            ),
            const ImageIcon(
              AppIcons.rightBack,
              size: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}
