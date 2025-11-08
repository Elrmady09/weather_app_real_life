import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherService {
  static const _apiKey = '8cff42310dd5592e53b0dff51fd372b9';
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<WeatherModel> fetchTodayWeather(String city) async {
    final url = Uri.parse('$_baseUrl/weather?q=$city&units=metric&appid=$_apiKey');
    final res = await http.get(url);
    final data = json.decode(res.body);

    return WeatherModel(
      condition: data['weather'][0]['main'],
      temp: (data['main']['temp'] as num).round(),
      location: '${data['name']}, ${data['sys']['country']}',
      date: DateTime.now(),
      feelsLike: (data['main']['feels_like'] as num).round(),
      iconAsset: 'assets/${data['weather'][0]['icon']}.svg',
    );
  }
}