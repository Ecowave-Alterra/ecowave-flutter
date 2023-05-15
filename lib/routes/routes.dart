import 'package:ecowave/routes/navigation.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final route = Nav.routes.firstWhere(
      (route) => route.path == settings.name,
      orElse: () => RouteConfig(
        path: '',
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text("Page Not Found")),
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      ),
    );
    return MaterialPageRoute(builder: (context) => route.builder(settings));
  }
}

class RouteConfig {
  final String path;
  final Widget Function(RouteSettings state) builder;

  RouteConfig({
    required this.path,
    required this.builder,
  });
}
