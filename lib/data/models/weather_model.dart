class WeatherModel {
  final String condition; // e.g. "Cloudy"
  final int temp;         // current temperature
  final String location;
  final DateTime date;
  final int feelsLike;
  final String iconAsset; // e.g. "assets/cloud.svg"

  WeatherModel({
    required this.condition,
    required this.temp,
    required this.location,
    required this.date,
    required this.feelsLike,
    required this.iconAsset,
  });
}