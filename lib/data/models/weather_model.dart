class WeatherModel {
  final String condition; // e.g. "Cloudy"
  final int temp;         // current temperature
  final String location;
  final DateTime date;
  final int feelsLike;
  final String iconAsset; // e.g. "assets/cloud.svg"

  // ✅ جديد: بيانات درجات الحرارة لكل ساعة
  final List<int> hourlyTemps; // درجات الحرارة لكل ساعة
  final List<DateTime> hourlyTimes; // الأوقات المقابلة لتلك الساعات


  WeatherModel({
    required this.condition,
    required this.temp,
    required this.location,
    required this.date,
    required this.feelsLike,
    required this.iconAsset,
    required this.hourlyTemps,
    required this.hourlyTimes,
  });
}