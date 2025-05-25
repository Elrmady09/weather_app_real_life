// main.dart
import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      // theme: AppTheme.lightTheme,
      // initialRoute: AppRoutes.home,
      // routes: AppRoutes.routes,
    );
  }
}
