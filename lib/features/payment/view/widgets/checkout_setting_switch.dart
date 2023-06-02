import 'package:ecowave/core.dart';
import 'package:flutter/cupertino.dart';

class CheckoutSettingSwitch extends StatelessWidget {
  final int currentPoint;
  final String label;
  final void Function(int value) onChanged;

  const CheckoutSettingSwitch({
    super.key,
    required this.currentPoint,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.primary, vertical: 7.0),
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
            label,
            style: const TextStyle(
              fontWeight: AppFontWeight.semibold,
            ),
          ),
          StatefulBuilder(
            builder: (context, setState) => CupertinoSwitch(
              value: isSwitched,
              onChanged: (value) {
                if (currentPoint < 1) {
                  "Maaf, Kamu tidak punya point".failedBar(context);
                } else {
                  isSwitched = value;
                  onChanged(currentPoint);
                  setState(() {});
                }
              },
              activeColor: AppColors.primary500,
            ),
          ),
        ],
      ),
    );
  }
}
