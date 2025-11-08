import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app_real_life/core/widget/space.dart';
import '../../../../../core/constants/app_colors.dart';

class WeatherHeader extends StatelessWidget {
  final String title;
  const WeatherHeader({Key? key, required this.title,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        WidthSpace(space: 0.02),
        Icon(Icons.arrow_drop_down_sharp,color:Colors.white ,),

      ],
    );
  }
}