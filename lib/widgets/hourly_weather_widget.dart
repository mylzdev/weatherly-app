import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/model/weather_data_hourly.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class HourlyWeatherWidget extends StatelessWidget {
  HourlyWeatherWidget({super.key, required this.weatherDataHourly});

  final WeatherDataHourly weatherDataHourly;

  // Card Index
  final RxInt cardIndex = GlobalController().getIndex();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        'Today'.text.size(16).make(),
        5.heightBox,
        hourlyList(),
      ],
    );
  }

  Widget hourlyList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: weatherDataHourly.hourly.length > 12
          ? 12
          : weatherDataHourly.hourly.length,
      itemBuilder: (context, index) {
        return Obx(
          () => GestureDetector(
            onTap: () {
              cardIndex.value = index;
            },
            child: Container(
              constraints: const BoxConstraints(minWidth: 90),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: cardIndex.value == index
                    ? const LinearGradient(
                        colors: [
                          CustomColors.firstGradientColor,
                          CustomColors.secondGradientColor
                        ],
                      )
                    : LinearGradient(
                        colors: [Colors.grey.shade200, CustomColors.cardColor],
                      ),
              ),
              child: HourlyDetails(
                index: index,
                cardIndex: cardIndex.toInt(),
                temp: weatherDataHourly.hourly[index].temp!,
                timeStamp: weatherDataHourly.hourly[index].dt!,
                weatherIcon: weatherDataHourly.hourly[index].weather![0].icon!,
              ),
            ),
          ),
        );
      },
    )
        .box
        .height(160)
        .padding(const EdgeInsets.symmetric(vertical: 10))
        .margin(const EdgeInsets.symmetric(horizontal: 15))
        .make();
  }
}

class HourlyDetails extends StatelessWidget {
  const HourlyDetails(
      {super.key,
      required this.timeStamp,
      required this.temp,
      required this.weatherIcon, required this.index, required this.cardIndex});

  final int index;
  final int cardIndex;
  final int temp;
  final int timeStamp;
  final String weatherIcon;

  String getTime(final timeStamp) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String x = DateFormat('jm').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        getTime(timeStamp)
            .text
            .color(cardIndex == index ? Colors.white : CustomColors.textColorBlack)
            .make()
            .box
            .margin(const EdgeInsets.only(top: 10))
            .make(),
        Image.asset('assets/weather/$weatherIcon.png')
            .box
            .size(40, 40)
            .margin(const EdgeInsets.all(5))
            .make(),
        '$temp°'
            .text
            .color(cardIndex == index ? Colors.white : CustomColors.textColorBlack)
            .make()
            .box
            .margin(const EdgeInsets.only(bottom: 10))
            .make(),
      ],
    );
  }
}
