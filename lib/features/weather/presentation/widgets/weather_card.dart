import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_real_life/features/weather/presentation/widgets/weather_header.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../core/utils/date_utils.dart' as custom_date;
import '../../../../data/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel data;
  const WeatherCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.5,
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const WeatherHeader(title: 'Today',),
          //SvgPicture.asset(data.iconAsset, width: 80, height: 80, color: AppColors.textLight),
          Container(
            width: size.width * 0.5,
            color: Colors.red,
            child: Row(
              children: [
                Text('${data.temp}°', style: TextStyle(fontSize: 64, color: AppColors.textLight)),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/cloud.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(data.condition, style: TextStyle(fontSize: 24, color: AppColors.textLight)),
          const Spacer(),
          Text(data.location, style: TextStyle(fontSize: 16)),
          Text(custom_date.DateUtils.formatDate(data.date), style: TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          Text('Feels like ${data.feelsLike}° | Sunset 18:20', style: TextStyle(fontSize: 12)),

        ],
      ),
    );
  }
}