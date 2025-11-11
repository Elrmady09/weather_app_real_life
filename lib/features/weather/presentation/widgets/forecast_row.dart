import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../providers/weather_provider.dart';

class ForecastRow extends StatelessWidget {
  const ForecastRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // ✅ نربط بالـ Provider للحصول على بيانات التوقعات
    final weatherProvider = Provider.of<WeatherProvider>(context);


    // ✅ نحصل على القائمتين من البروفايدر
    final temps = weatherProvider.hourlyTemps;
    final times = weatherProvider.hourlyTimes;

    // ✅ إذا لم يتم تحميل البيانات بعد
    if (temps.isEmpty || times.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    // ✅ نأخذ فقط أول 10 ساعات كحد أقصى (كما في الكود القديم)
    final count = temps.length < 10 ? temps.length : 10;

    // ✅ نجهز قائمة الخرائط لعرضها في الواجهة
    final forecast = List.generate(count, (i) {
      final hour = times[i];
      final formattedTime = i == 0
          ? 'Now'
          : DateFormat('h a').format(hour); // مثل 3 PM أو 4 AM

      return {
        'time': formattedTime,
        'temp': '${temps[i]}°',
      };
    });




    // ✅ نقسمها إلى صفين (5 عناصر في كل صف)
    final firstRow = forecast.take(5).toList();
    final secondRow = forecast.skip(5).take(5).toList();


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


// 🧩 دالة بناء صف التوقعات (نفس القديمة لكن تأخذ البيانات من الـ Provider)
Widget _buildForecastRow(List<Map<String, dynamic>> rowData) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: rowData.map((item) {
      final time = item['time']; // مثل "03 PM"
      final temp = item['temp']; // مثل "25°"
      return Column(
        children: [
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            temp,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      );
    }).toList(),
  );
}