import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widget/space.dart';
import '../../../../providers/weather_provider.dart';
import '../widgets/forecast_row.dart';
import '../widgets/weather_card.dart';
import '../widgets/weather_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<WeatherProvider>(context);
    prov.loadToday('Los Angeles');

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية كاملة
          Container(color: AppColors.cloudyBg),
          // المحتوى
          Column(
            children: [
              const HeightSpace(space: 0.04),
              const HeightSpace(space: 0.02),
              if (prov.today != null)
                WeatherCard(data: prov.today!),
              const HeightSpace(space: 0.02),
              const ForecastRow(),
              // ...يمكن إضافة المزيد من المحتوى أسفل
            ],
          ),
        ],
      ),
    );
  }
}