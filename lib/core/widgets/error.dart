part of 'package:ecowave/core.dart';

class EcoError extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onRetry;

  const EcoError({Key? key, required this.errorMessage, required this.onRetry})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 48.0,
            color: AppColors.primary400,
          ),
          const SizedBox(height: AppSizes.primary),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.secondary),
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: AppSizes.primary, color: AppColors.grey700),
            ),
          ),
          const SizedBox(height: AppSizes.primary),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}