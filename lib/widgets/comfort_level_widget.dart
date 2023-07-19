import 'package:flutter/widgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherapp_starter_project/model/weather_data_current.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class ComfortLevelWidget extends StatelessWidget {
  const ComfortLevelWidget({super.key, required this.weatherDataCurrent});

  final WeatherDataCurrent weatherDataCurrent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        5.heightBox,
        'Comfort Level'.text.size(16).make(),
        20.heightBox,
        Column(
          children: [
            Center(
              child: SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: weatherDataCurrent.current.humidity!.toDouble(),
                appearance: CircularSliderAppearance(
                  customWidths: CustomSliderWidths(
                    handlerSize: 0,
                    trackWidth: 12,
                    progressBarWidth: 12,
                  ),
                  infoProperties: InfoProperties(
                    bottomLabelText: 'Humidity',
                    bottomLabelStyle: const TextStyle(
                        letterSpacing: 0.1, fontSize: 14, height: 1.5),
                  ),
                  animationEnabled: true,
                  size: 140,
                  customColors: CustomSliderColors(
                    hideShadow: true,
                    trackColor: CustomColors.firstGradientColor.withAlpha(100),
                    progressBarColors: [
                      CustomColors.firstGradientColor,
                      CustomColors.secondGradientColor
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Feels Like ',
                        style: TextStyle(
                          fontSize: 14,
                          height: 0.8,
                          color: CustomColors.textColorBlack,
                        ),
                      ),
                      TextSpan(
                        text: '${weatherDataCurrent.current.feelsLike}',
                        style: const TextStyle(
                          fontSize: 14,
                          height: 0.8,
                          color: CustomColors.textColorBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  color: CustomColors.dividerLine,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'UV Index ',
                        style: TextStyle(
                          fontSize: 14,
                          height: 0.8,
                          color: CustomColors.textColorBlack,
                        ),
                      ),
                      TextSpan(
                        text: '${weatherDataCurrent.current.uvIndex}',
                        style: const TextStyle(
                          fontSize: 14,
                          height: 0.8,
                          color: CustomColors.textColorBlack,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ).box.height(180).make(),
      ],
    ).box.make();
  }
}
