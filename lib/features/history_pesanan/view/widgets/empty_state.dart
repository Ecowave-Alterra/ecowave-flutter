part of 'package:ecowave/core.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 97),
        child: Column(
          children: [
            const SizedBox(
              height: 85,
            ),
            Image.asset("assets/images/emptyKeranjang.png"),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Belum ada pesanan",
              style: TextStyle(
                  fontWeight: AppFontWeight.semibold, color: AppColors.grey500),
            )
          ],
        ),
      ),
    );
  }
}
