import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherapp_starter_project/model/weather_data_daily.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class DailyWeatherWidget extends StatelessWidget {
  const DailyWeatherWidget({super.key, required this.weatherDataDaily});

  final WeatherDataDaily weatherDataDaily;

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        'Next Days'
            .text
            .black
            .size(16)
            .make()
            .box
            .margin(const EdgeInsets.only(bottom: 10))
            .alignTopLeft
            .make(),
        dailyList(),
      ],
    )
        .box
        .color(CustomColors.cardColor)
        .rounded
        .height(380)
        .margin(const EdgeInsets.all(20))
        .padding(const EdgeInsets.all(15))
        .make();
  }

  Widget dailyList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount:
          weatherDataDaily.daily.length > 7 ? 7 : weatherDataDaily.daily.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                getDay(weatherDataDaily.daily[index].dt)
                    .text
                    .size(14)
                    .make()
                    .box
                    .width(80)
                    .make(),
                Image.asset(
                  'assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png',
                ).box.size(30, 30).make(),
                '${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}° '
                    .text
                    .make(),
              ],
            ).box.height(60).make(),
            Container(
              height: 1,
              color: index == weatherDataDaily.daily.length - 2
                  ? null
                  : Colors.grey[300],
            ),
          ],
        );
      },
    ).box.height(300).make();
  }
}
