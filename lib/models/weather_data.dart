class WeatherDataPoint {
  final double temperature;
  final double humidity;
  final double uvIndex;
  final double precipitation;
  final WindDataPoint windDataPoint;
  final DateTime time;

  WeatherDataPoint(
    this.temperature,
    this.humidity,
    this.uvIndex,
    this.precipitation,
    this.time,
    this.windDataPoint,
  );
}

class WindDataPoint {
  final double speed;
  final double degree;

  WindDataPoint(this.speed, this.degree);
}
