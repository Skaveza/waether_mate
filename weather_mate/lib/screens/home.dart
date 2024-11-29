import 'package:flutter/material.dart';
import 'package:weather_mate/services/weather_service.dart';
import 'package:weather_mate/models/weather.dart';
import 'package:weather_mate/screens/forecast.dart';
import 'package:weather_mate/screens/details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  Weather? _weather;
  bool _isLoading = false;
  String _errorMessage = '';

  void _getWeather(String city) async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final weather = await WeatherService.fetchCurrentWeather(city);
      setState(() {
        _weather = weather;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to fetch weather data. Please check the city name or your internet connection.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'WeatherMate',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                _buildSearchField(),
                const SizedBox(height: 20),
                _buildWeatherDisplay(),
                const Spacer(),
                _buildForecastButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter city name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            _getWeather(_controller.text);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
          ),
          child: const Icon(Icons.search, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _buildWeatherDisplay() {
    if (_isLoading) {
      return const CircularProgressIndicator(color: Colors.white);
    }

    if (_weather != null) {
      return Column(
        children: [
          const SizedBox(height: 20),
          Text(
            '${_weather!.temperature}°C',
            style: const TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            _weather!.description.toUpperCase(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 20),
          Card(
            color: Colors.white.withOpacity(0.2),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _weatherInfo('Humidity', '${_weather!.humidity}%'),
                  _weatherInfo('Wind', '${_weather!.windSpeed} m/s'),
                  _weatherInfo('Pressure', '${_weather!.pressure} hPa'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (_weather != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(weather: _weather!),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              'View Details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    }

    return Text(
      _errorMessage.isEmpty
          ? 'Enter a city to get weather details'
          : _errorMessage,
      style: const TextStyle(color: Colors.white, fontSize: 16),
      textAlign: TextAlign.center,
    );
  }

  Widget _weatherInfo(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.white70),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildForecastButton() {
    return ElevatedButton(
      onPressed: _weather != null
          ? () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForecastScreen(city: _controller.text),
          ),
        );
      }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: _weather != null ? Colors.orange : Colors.grey,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
      ),
      child: const Text(
        'View 7-Day Forecast',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
