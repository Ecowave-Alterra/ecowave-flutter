import 'package:ecowave/app.dart';
import 'package:ecowave/core/utils/injector.dart' as di;
import 'package:flutter/material.dart';

void main() {
  di.init();
  runApp(const App());
}
