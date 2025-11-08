import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_real_life/features/weather/presentation/widgets/weather_header.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../core/utils/date_utils.dart' as custom_date;
import '../../../../core/widget/space.dart';
import '../../../../data/models/weather_model.dart';
import '../../../../providers/weather_provider.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel data;
  const WeatherCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final condition = weatherProvider.currentWeather.condition;


    // 🟡 تحديد الأيقونة بناءً على الحالة
    final String iconPath = _getWeatherIcon(condition);

    return Container(
      width: size.width * 0.9,
      height: size.height * 0.5,
      decoration: BoxDecoration(
        color: AppColors.cloudy1.withOpacity(0.9),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const WeatherHeader(title: 'Today',),
          //SvgPicture.asset(data.iconAsset, width: 80, height: 80, color: AppColors.textLight),
          SizedBox(
            width: size.width * 0.7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.24,
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(iconPath),
                      colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.7), // ← اللون والتعتيم
                        BlendMode.srcIn,               // ← نمط الدمج
                      ),

                    ),
                  ),
                ),
                WidthSpace(space: 0.025,),
                Text('${data.temp}°', style: TextStyle(fontSize: size.width * 0.23, color: AppColors.textLight)),

              ],
            ),
          ),
          Text(data.condition, style: TextStyle(fontSize: size.width * 0.1, color: AppColors.textLight)),
          HeightSpace(space: 0.015),
          Text(data.location, style: TextStyle(fontSize: 16)),
          Text(custom_date.DateUtils.formatDate(data.date), style: TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          Text('Feels like ${data.feelsLike}° | Sunset 18:20', style: TextStyle(fontSize: 12)),

        ],
      ),
    );
  }
}



// 🔹 دالة لتحديد الصورة حسب الحالة الجوية
String _getWeatherIcon(String condition) {
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return 'assets/icons/sun.png';
    case 'rainy':
    case 'rain':
      return 'assets/icons/rain.png';
    case 'cloudy':
    case 'clouds':
    default:
      return 'assets/icons/cloud.png';
  }
}