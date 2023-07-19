import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  const CurrentWeatherWidget({super.key, required this.weatherDataCurrent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Temperature
        temperatureAreaWidget(),
        10.heightBox,
        currentWeatherDetailsWidget(),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
                'assets/weather/${weatherDataCurrent.current.weather![0].icon}.png')
            .box
            .size(80, 80)
            .make(),
        Container()
            .box
            .height(50)
            .width(1)
            .color(CustomColors.dividerLine)
            .make(),
        RichText(
          text: TextSpan(
            children: [
              '${weatherDataCurrent.current.temp!.toInt()}°'
                  .textSpan
                  .size(68)
                  .semiBold
                  .color(CustomColors.textColorBlack)
                  .make(),
              '${weatherDataCurrent.current.weather![0].description}'
                  .textSpan
                  .size(15)
                  .light
                  .gray400
                  .make(),
            ],
          ),
        )
      ],
    );
  }

  Widget currentWeatherDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/icons/windspeed.png')
                .box
                .size(60, 60)
                .padding(const EdgeInsets.all(16))
                .color(CustomColors.cardColor)
                .rounded
                .make(),
            Image.asset('assets/icons/clouds.png')
                .box
                .size(60, 60)
                .padding(const EdgeInsets.all(16))
                .color(CustomColors.cardColor)
                .rounded
                .make(),
            Image.asset('assets/icons/humidity.png')
                .box
                .size(60, 60)
                .padding(const EdgeInsets.all(16))
                .color(CustomColors.cardColor)
                .rounded
                .make(),
          ],
        ),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
              width: 60,
              child: '${weatherDataCurrent.current.windSpeed} km/hr'
                  .text
                  .size(12)
                  .align(TextAlign.center)
                  .make(),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: '${weatherDataCurrent.current.clouds}%'
                  .text
                  .size(12)
                  .align(TextAlign.center)
                  .make(),
            ),
            SizedBox(
              height: 20,
              width: 60,
              child: '${weatherDataCurrent.current.humidity}%'
                  .text
                  .size(12)
                  .align(TextAlign.center)
                  .make(),
            ),
          ],
        )
      ],
    );
  }
}
