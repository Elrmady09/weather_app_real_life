import 'package:flutter/material.dart';
import '../data/models/weather_model.dart';
import '../data/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final _service = WeatherService();
  WeatherModel? today;

  Future<void> loadToday(String city) async {
    today = await _service.fetchTodayWeather(city);
    notifyListeners();
  }
}