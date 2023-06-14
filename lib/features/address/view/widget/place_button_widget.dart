import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String leading;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;

    return OutlinedButton(
      onPressed: () => onChanged(value),
      style: isSelected
          ? OutlinedButton.styleFrom(
              backgroundColor: AppColors.primary400,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: const BorderSide(
                color: AppColors.primary400,
              ))
          : OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: const BorderSide(
                color: AppColors.grey500,
              )),
      child: Text(
        leading,
        style: TextStyle(
            fontSize: 14,
            fontWeight: AppFontWeight.regular,
            color: isSelected ? AppColors.white : AppColors.grey700),
      ),
    );
  }
}
