import 'package:flutter/material.dart';
import '../features/weather/presentation/screens/home_screen.dart';

class AppRoutes {
  static const home = '/';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (_) => const HomeScreen(),
    };
  }
}