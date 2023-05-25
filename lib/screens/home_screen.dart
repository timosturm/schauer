import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schauer/services/weather_service.dart';
import 'package:schauer/widgets/weather_card.dart';

class OverviewPage extends StatelessWidget {
  final WeatherService _weatherService =
      const WeatherServiceFake("FakeLocation");

  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      GestureDetector(
        onTap: () => context.go(
          "/forecast_short",
          extra: ForecastWidget(_weatherService.shortForecast()),
        ),
        child: Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: Hero(
            tag: "forecast_short",
            child: ForecastWidget(_weatherService.shortForecast()),
          ),
        ),
      ),
      Container(
        color: Colors.blue,
        alignment: Alignment.center,
        child: CurrentWeather(
          _weatherService.currentWeather(),
          _weatherService.location.toString(),
        ),
      ),
      Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: const Text("humidity"),
      ),
      GestureDetector(
        onTap: () => context.go(
          "/forecast_long",
          extra: ForecastWidget(_weatherService.longForecast()),
        ),
        child: Container(
          color: Colors.orange,
          alignment: Alignment.center,
          child: Hero(
            tag: "forecast_long",
            child: ForecastWidget(_weatherService.longForecast()),
          ),
        ),
      )
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Weather in ${_weatherService.location}')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int count;
          if (constraints.maxWidth < 1920) {
            count = 1;
          } else if (constraints.maxWidth < 4 * 1920) {
            count = 2;
          } else {
            count = 4;
          }

          double ratio =
              count > 1 ? constraints.maxWidth / constraints.maxHeight : 2;

          return GridView.count(
            crossAxisCount: count,
            childAspectRatio: ratio,
            children: _children,
          );
        },
      ),
    );
  }
}
