part of 'package:ecowave/core.dart';

class EcoFormInput extends StatelessWidget {
  final String hint;
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? icon;
  final void Function(String value)? onChanged;
  const EcoFormInput({
    super.key,
    required this.hint,
    required this.label,
    this.controller,
    this.keyboardType,
    this.validator,
    this.icon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Color(0xFFADB5C2)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Color(0xFFADB5C2)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Color(0xFFADB5C2)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(color: Color(0xFFC8291E)),
        ),
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF737D8C)),
        prefixIcon: icon,
      ),
    );
  }
}
