import 'package:flutter/material.dart';
import '../data/models/weather_model.dart';
import '../data/services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  final _service = WeatherService();

  WeatherModel? today;
  WeatherModel? _currentWeather; // ✅ أضفناها

  // 🔹 تحميل بيانات طقس اليوم
  Future<void> loadToday(String city) async {
    today = await _service.fetchTodayWeather(city);
    _currentWeather = today; // ✅ نحدث currentWeather بنفس القيمة
    notifyListeners();
  }

  // ✅ Getter للوصول للحالة الحالية
  WeatherModel get currentWeather => _currentWeather!;

  bool get hasData => _currentWeather != null;

  // ✅ استخراج الحالة الجوية مثل (sunny / rainy / cloudy)
  String get condition {
    if (_currentWeather == null) return 'cloudy'; // افتراضي قبل التحميل
    final cond = _currentWeather!.condition.toLowerCase();

    if (cond.contains('clear')) return 'sunny';
    if (cond.contains('rain')) return 'rainy';
    if (cond.contains('cloud')) return 'cloudy';
    return 'cloudy';
  }
}
