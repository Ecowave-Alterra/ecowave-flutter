import 'package:flutter/material.dart';

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
            color: Colors.greenAccent,
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16.0, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}