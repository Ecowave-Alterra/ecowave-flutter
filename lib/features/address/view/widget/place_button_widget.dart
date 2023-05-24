import 'package:ecowave/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    //   onTap: () => onChanged(value),
    //   child: Container(
    //     height: 56,
    //     padding: EdgeInsets.symmetric(horizontal: 16),
    //     child: Row(
    //       children: [
    //         _customRadioButton,
    //         SizedBox(width: 12),
    //         if (title != null) title,
    //       ],
    //     ),
    //   ),
    // );
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
                color: AppColors.grey700,
              )),
      child: Text(
        leading,
        style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: AppFontWeight.regular,
            color: isSelected ? AppColors.white : AppColors.grey700),
      ),
    );
  }

  // Widget get _customRadioButton {
  //   final isSelected = value == groupValue;
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //     decoration: BoxDecoration(
  //       color: isSelected ? Colors.blue : null,
  //       borderRadius: BorderRadius.circular(4),
  //       border: Border.all(
  //         color: isSelected ? Colors.blue : Colors.grey[300]!,
  //         width: 2,
  //       ),
  //     ),
  //     child: Text(
  //       leading,
  //       style: TextStyle(
  //         color: isSelected ? Colors.white : Colors.grey[600]!,
  //         fontWeight: FontWeight.bold,
  //         fontSize: 18,
  //       ),
  //     ),
  //   );
  // }
}
