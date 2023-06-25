import 'dart:async';

import 'package:ecowave/core.dart';
import 'package:ecowave/features/home/bloc/home/home_bloc.dart';
import 'package:ecowave/features/home/view/home_page.dart';
import 'package:ecowave/features/payment/bloc/payment_status/payment_status_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {
  final String paymentId;
  final String paymentUrl;

  const PaymentPage({
    super.key,
    required this.paymentId,
    required this.paymentUrl,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late final WebViewController _controller;
  late Timer timer;

  void checkPaymentStatus() {
    context.read<PaymentStatusBloc>().add(widget.paymentId);
    final String paymentStatus = context.read<PaymentStatusBloc>().state;
    debugPrint("paymentStatus: $paymentStatus");

    if (paymentStatus == "settlement") {
      context.read<HomeBloc>().add(const OnBottomNavTap(1));
      context.pushAndRemoveUntil<bool>(const MyHomePage(), (route) => false);
    }
  }

  @override
  void initState() {
    const PlatformWebViewControllerCreationParams params =
        PlatformWebViewControllerCreationParams();
    _controller = WebViewController.fromPlatformCreationParams(params);

    _controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
              Page resource error:
              code: ${error.errorCode}
              description: ${error.description}
              errorType: ${error.errorType}
              isForMainFrame: ${error.isForMainFrame}
          ''');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));

    timer = Timer.periodic(
        const Duration(seconds: 5), (Timer t) => checkPaymentStatus());
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pembayaran"),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
