class Weather {
  Weather({
    this.temperature = 20,
    this.Humidity = 60,
    this.mainCondition = 'loading...',
  });
  final double temperature;
  final double Humidity;
  final String mainCondition;
  // final String mainCondition;
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temperature: json['main']['temp'].toDouble(),
        Humidity: json['main']['humidity'].toDouble(),
        mainCondition: json['weather'][0]['main']);
  }
}
