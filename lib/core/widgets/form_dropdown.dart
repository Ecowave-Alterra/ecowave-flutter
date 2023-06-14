part of 'package:ecowave/core.dart';

class EcoFormDropdown extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? initialValue;
  final void Function(String? value)? onChanged;

  const EcoFormDropdown({
    super.key,
    required this.label,
    required this.options,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSizes.secondary,
          vertical: AppSizes.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusForm),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusForm),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusForm),
          borderSide: const BorderSide(color: AppColors.grey300),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusForm),
          borderSide: const BorderSide(color: AppColors.error500),
        ),
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.grey500),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      items: options.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );
  }
}
