class Weather {
  final String city;
  final String description;
  final double temperature;
  final double windSpeed;
  final int humidity;
  final int pressure;
  final int sunrise;
  final int sunset;

  Weather({
    required this.city,
    required this.description,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.pressure,
    required this.sunrise,
    required this.sunset,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'] ?? 'Unknown', // City name from API
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
    );
  }
}
