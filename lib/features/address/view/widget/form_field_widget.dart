import 'package:flutter/material.dart';

import '../../../../core.dart';

class FormFieldAddress extends StatelessWidget {
  const FormFieldAddress({
    super.key,
    required this.nameController,
    required this.icon,
    required this.label,
    required this.keyboardType,
  });

  final TextEditingController nameController;
  final AssetImage icon;
  final String label;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.error500),
        ),
        prefixIconConstraints: const BoxConstraints(
          minHeight: 18,
          minWidth: 18,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 19),
          child: ImageIcon(
            icon,
            color: AppColors.grey500,
          ),
        ),
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: AppFontWeight.regular,
          color: AppColors.grey500,
        ),
      ),
      style: const TextStyle(
        fontSize: 14,
        fontWeight: AppFontWeight.regular,
        color: AppColors.black,
      ),
      keyboardType: keyboardType,
    );
  }
}
