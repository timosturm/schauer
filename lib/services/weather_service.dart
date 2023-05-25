import 'package:schauer/models/weather_data.dart';

abstract class WeatherService {
  final Object location;

  const WeatherService(this.location);

  WeatherDataPoint currentWeather();

  List<WeatherDataPoint> shortForecast();

  List<WeatherDataPoint> longForecast();
}

class WeatherServiceFake extends WeatherService {
  const WeatherServiceFake(super.location);

  @override
  WeatherDataPoint currentWeather() =>
      WeatherDataPoint(22, 76, 2, 45, DateTime.now(), WindDataPoint(33, 8));

  @override
  List<WeatherDataPoint> longForecast() => [
        WeatherDataPoint(
            22, 76, 2, 0, DateTime(2023, 1, 1), WindDataPoint(33, 8)),
        WeatherDataPoint(
            19, 76, 2, 32, DateTime(2023, 1, 2), WindDataPoint(33, 8)),
        WeatherDataPoint(
            14, 76, 2, 64, DateTime(2023, 1, 3), WindDataPoint(33, 8)),
        WeatherDataPoint(
            -8, 76, 2, 87, DateTime(2023, 1, 4), WindDataPoint(33, 8)),
        WeatherDataPoint(
            13, 76, 2, 45, DateTime(2023, 1, 5), WindDataPoint(33, 8)),
        WeatherDataPoint(
            17, 76, 2, 33, DateTime(2023, 1, 6), WindDataPoint(33, 8)),
        WeatherDataPoint(
            23, 76, 2, 12, DateTime(2023, 1, 7), WindDataPoint(33, 8)),
      ];

  @override
  List<WeatherDataPoint> shortForecast() => [
        WeatherDataPoint(
            22, 76, 2, 11, DateTime(2023, 1, 1, 12, 0), WindDataPoint(33, 8)),
        WeatherDataPoint(
            23, 76, 2, 13, DateTime(2023, 1, 1, 12, 30), WindDataPoint(33, 8)),
        WeatherDataPoint(
            23, 76, 2, 17, DateTime(2023, 1, 1, 13, 0), WindDataPoint(33, 8)),
        WeatherDataPoint(
            22, 76, 2, 33, DateTime(2023, 1, 1, 13, 30), WindDataPoint(33, 8)),
        WeatherDataPoint(
            21, 76, 2, 22, DateTime(2023, 1, 1, 14, 0), WindDataPoint(33, 8)),
        WeatherDataPoint(
            24, 76, 2, 13, DateTime(2023, 1, 1, 14, 30), WindDataPoint(33, 8)),
        WeatherDataPoint(
            25, 76, 2, 66, DateTime(2023, 1, 1, 15, 0), WindDataPoint(33, 8)),
        WeatherDataPoint(
            27, 76, 2, 88, DateTime(2023, 1, 1, 15, 30), WindDataPoint(33, 8)),
        WeatherDataPoint(
            27, 76, 2, 100, DateTime(2023, 1, 1, 16, 0), WindDataPoint(33, 8)),
        WeatherDataPoint(
            24, 76, 2, 5, DateTime(2023, 1, 1, 16, 30), WindDataPoint(33, 8)),
        WeatherDataPoint(
            21, 76, 2, 45, DateTime(2023, 1, 1, 17, 0), WindDataPoint(33, 8)),
        WeatherDataPoint(
            19, 76, 2, 95, DateTime(2023, 1, 1, 17, 30), WindDataPoint(33, 8)),
      ];
}

class WeatherServiceTomorrow extends WeatherService {
  const WeatherServiceTomorrow(super.location);

  @override
  WeatherDataPoint currentWeather() {
    // TODO: implement currentWeather
    throw UnimplementedError();
  }

  @override
  List<WeatherDataPoint> longForecast() {
    // TODO: implement longForecast
    throw UnimplementedError();
  }

  @override
  List<WeatherDataPoint> shortForecast() {
    // TODO: implement shortForecast
    throw UnimplementedError();
  }
}
