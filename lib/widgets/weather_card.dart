import 'package:flutter/material.dart';
import 'package:schauer/models/weather_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

abstract class GraphWidget extends StatelessWidget {
  // TODO It would be best to show this type of data:
  //  temperature, highlight high and low
  //  precipitation, chance and amount
  //  humidity
  //  uv index
  //  air quality
  //  visibility
  //  atmospheric pressure
  //  time of sunrise and sunset

  const GraphWidget({super.key});

  @override
  Widget build(BuildContext context);
}

class ForecastWidget extends GraphWidget {
  final List<WeatherDataPoint> _weatherDataPoints;

  String _duration() {
    WeatherDataPoint firstDay =
        _weatherDataPoints.reduce((a, b) => a.time.isAfter(b.time) ? b : a);
    WeatherDataPoint lastDay =
        _weatherDataPoints.reduce((a, b) => a.time.isAfter(b.time) ? a : b);

    Duration duration = (lastDay.time.difference(firstDay.time));

    if (duration.inDays <= 0) {
      DateTime d = DateTime.fromMillisecondsSinceEpoch(duration.inMilliseconds);
      return "${d.hour}:${d.minute}";
    } else {
      return "${duration.inDays} days";
    }
  }

  ForecastWidget(this._weatherDataPoints, {super.key});

  String _weekdayToString(int weekday) {
    switch (weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thu";
      case 5:
        return "Fry";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "???";
    }
  }

  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  String _xValueMapper(WeatherDataPoint w, _) =>
      "${_weekdayToString(w.time.weekday)} ${w.time.hour}:${w.time.minute}";

  final MajorGridLines _majorGridLines = const MajorGridLines(width: 0);

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(
          isVisible: true,
          title: AxisTitle(text: "Date"),
        ),
        primaryYAxis: NumericAxis(
          isVisible: true,
          title: AxisTitle(text: "Degree"),
          labelFormat: "{value}°C",
          majorGridLines: _majorGridLines,
        ),
        axes: [
          NumericAxis(
            name: "yAxis",
            title: AxisTitle(text: "Precipitation"),
            labelFormat: "{value}%",
            opposedPosition: true,
            majorGridLines: _majorGridLines,
          )
        ],
        title: ChartTitle(text: "Weather Forecast - ${_duration()}"),
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          alignment: ChartAlignment.center,
        ),
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries<WeatherDataPoint, String>>[
          LineSeries<WeatherDataPoint, String>(
              dataSource: _weatherDataPoints,
              xValueMapper: _xValueMapper,
              yValueMapper: (WeatherDataPoint weatherDataPoint, _) =>
                  weatherDataPoint.temperature,
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              name: "Temperature",
              color: Colors.red,
              animationDuration: 0,
              markerSettings: const MarkerSettings(
                  isVisible: true,
                  // Marker shape is set to diamond
                  shape: DataMarkerType.circle)),
          LineSeries<WeatherDataPoint, String>(
              dataSource: _weatherDataPoints,
              xValueMapper: _xValueMapper,
              yValueMapper: (WeatherDataPoint weatherDataPoint, _) =>
                  weatherDataPoint.precipitation,
              yAxisName: "yAxis",
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              name: "Precipitation",
              color: Colors.blue,
              animationDuration: 0,
              markerSettings: const MarkerSettings(
                  isVisible: true,
                  // Marker shape is set to diamond
                  shape: DataMarkerType.triangle)),
        ]);
  }
}

class CurrentWeather extends GraphWidget {
  final String _location;
  final WeatherDataPoint _weatherDataPoint;

  const CurrentWeather(this._weatherDataPoint, this._location, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Current weather in ${_location}"),
        subtitle: Text("Precipitation: ${_weatherDataPoint.precipitation}\n"
            "Temperature: ${_weatherDataPoint.temperature}°C"),
      ),
    );
  }
}
