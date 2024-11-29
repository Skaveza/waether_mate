import 'package:flutter/material.dart';
import 'package:weather_mate/services/weather_service.dart';
import 'package:weather_mate/models/forecast.dart';

class ForecastScreen extends StatefulWidget {
  final String city;

  const ForecastScreen({super.key, required this.city});

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  List<Forecast>? _forecast;
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _getForecast();
  }

  void _getForecast() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final forecast = await WeatherService.fetchForecast(widget.city);
      setState(() {
        _forecast = forecast;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load forecast data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.city} - 7-Day Forecast'),
        backgroundColor: Colors.blue,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _forecast != null
          ? ListView.builder(
        itemCount: _forecast!.length,
        itemBuilder: (context, index) {
          final forecast = _forecast![index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: Colors.lightBlueAccent,
            child: ListTile(
              title: Text(
                forecast.date,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                forecast.description,
                style: const TextStyle(color: Colors.white70),
              ),
              trailing: Text(
                '${forecast.temperature}°C',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      )
          : Center(
        child: Text(
          _errorMessage,
          style: const TextStyle(color: Colors.red, fontSize: 16),
        ),
      ),
    );
  }
}
