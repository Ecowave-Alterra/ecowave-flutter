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
      home: const Placeholder(),
      onGenerateRoute: Routes.generateRoute,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: const Color(0xff111827),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xff111827),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Color(0xff059669),
          ),
          shape: Border(
            bottom: BorderSide(
              color: Color(0xffADB5C2),
            ),
          ),
        ),
      ),
    );
  }
}
