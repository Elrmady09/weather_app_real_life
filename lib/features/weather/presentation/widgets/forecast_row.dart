import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_colors.dart';

class ForecastRow extends StatelessWidget {
  const ForecastRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final forecast = [
      {'time': 'Now', 'temp': '25°'},
      {'time': '2 AM', 'temp': '25°'},
      {'time': '3 AM', 'temp': '23°'},
      {'time': '4 AM', 'temp': '22°'},
      {'time': '5 AM', 'temp': '20°'},
      {'time': '6 AM', 'temp': '25°'},
      {'time': '7 AM', 'temp': '25°'},
      {'time': '8 AM', 'temp': '23°'},
      {'time': '9 AM', 'temp': '22°'},
      {'time': '10 AM', 'temp': '20°'},
    ];


    // نقسمها إلى صفين (5 عناصر في كل صف)
    final firstRow = forecast.sublist(0, 5);
    final secondRow = forecast.sublist(5, 10);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: AppColors.cloudy1.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildForecastRow(firstRow),
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
            height: size.height * 0.002,
            decoration: BoxDecoration(
              color: Colors.white,

            ),
          ),

          _buildForecastRow(secondRow),
        ],
      ),
    );
  }
}


Widget _buildForecastRow(List<Map<String, String>> rowData) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: rowData.map((item) {
      return Column(
        children: [
          Text(
            item['time']!,
            style: const TextStyle(fontSize: 12, color: Colors.white,fontWeight:FontWeight.w900 ),
          ),
          const SizedBox(height: 4),
          Text(
            item['temp']!,
            style: const TextStyle(fontSize: 12, color: Colors.white,fontWeight:FontWeight.w900),
          ),
        ],
      );
    }).toList(),
  );
}
