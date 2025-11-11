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
    prov.loadToday('Liverpool');

    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // الخلفية كاملة
            Container(
                //color: AppColors.cloudyBg,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/home/cloud1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),

            ),
            // المحتوى
            Column(
              children: [
                const HeightSpace(space: 0.06),
                if (prov.today != null)
                  WeatherCard(data: prov.today!),
                const HeightSpace(space: 0.02),
                const ForecastRow(),

              ],
            ),
          ],
        ),
      ),
    );
  }
}