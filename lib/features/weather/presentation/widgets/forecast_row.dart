import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_colors.dart';

class ForecastRow extends StatelessWidget {
  const ForecastRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hours = ['Now', '2 AM', '3 AM', '4 AM', '5 AM'];
    final temps = ['25°', '25°', '23°', '22°', '20°'];
    //final icons = List.filled(5, 'assets/cloud.svg');
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(hours.length, (i) {
          return Column(
            children: [
              Text(hours[i], style: TextStyle(fontSize: 12)),
              const SizedBox(height: 4),
              Text(temps[i], style: TextStyle(fontSize: 12)),
            ],
          );
        }),
      ),
    );
  }
}