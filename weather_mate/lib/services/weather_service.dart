import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_mate/models/weather.dart';
import 'package:weather_mate/models/forecast.dart';

class WeatherService {
  static const String apiKey = 'bb49eaca9397fe251511a4ef0bfb9b73';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/';

  // Fetch Current Weather
  static Future<Weather> fetchCurrentWeather(String city) async {
    try {
      final uri = Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey&units=metric');
      final response = await http.get(uri).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Weather.fromJson(data);
      } else {
        print('Error fetching weather data: ${response.statusCode}, ${response.body}');
        throw Exception('Failed to fetch weather data: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception in fetchCurrentWeather: $e');
      throw Exception('Failed to fetch weather. Please check your connection.');
    }
  }

  // Fetch 7-Day Forecast
  static Future<List<Forecast>> fetchForecast(String city) async {
    try {
      final uri = Uri.parse('$baseUrl/forecast?q=$city&appid=$apiKey&units=metric');
      final response = await http.get(uri).timeout(Duration(seconds: 10));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body)['list'];
        return data.map((json) => Forecast.fromJson(json)).toList();
      } else {
        print('Error fetching forecast data: ${response.statusCode}, ${response.body}');
        throw Exception('Failed to fetch forecast data: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception in fetchForecast: $e');
      throw Exception('Failed to fetch forecast. Please check your connection.');
    }
  }
}
