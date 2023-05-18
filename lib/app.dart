import 'package:ecowave/core.dart';
import 'package:ecowave/features/payment/view/pages/payment_detail_page.dart';
import 'package:ecowave/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecowave',
      home: const PaymentDetailPage(),
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: AppColors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.black,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: AppColors.primary500,
          ),
          shape: Border(
            bottom: BorderSide(
              color: AppColors.grey300.withOpacity(0.5),
            ),
          ),
        ),
        dividerTheme: DividerThemeData(
          color: AppColors.grey300.withOpacity(0.5),
        ),
      ),
    );
  }
}
