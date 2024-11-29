import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_mate/models/weather.dart';

class DetailsScreen extends StatelessWidget {
  final Weather weather;

  DetailsScreen({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Weather Details'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SafeArea( // Added SafeArea to prevent overflow on different devices
        child: SingleChildScrollView( // Ensure the entire content is scrollable
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // City Name
                Center(
                  child: Column(
                    children: [
                      Text(
                        weather.city,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        weather.description.toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                // Weather Details Grid
                LayoutBuilder(
                  builder: (context, constraints) {
                    return GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.5, // Adjusted for better proportions
                      shrinkWrap: true, // Allow GridView to take only the necessary space
                      physics: NeverScrollableScrollPhysics(), // Prevent internal scrolling
                      children: [
                        _weatherDetailItem(
                          icon: FontAwesomeIcons.thermometerHalf,
                          label: 'Temperature',
                          value: '${weather.temperature}°C',
                        ),
                        _weatherDetailItem(
                          icon: FontAwesomeIcons.wind,
                          label: 'Wind Speed',
                          value: '${weather.windSpeed} m/s',
                        ),
                        _weatherDetailItem(
                          icon: FontAwesomeIcons.water,
                          label: 'Humidity',
                          value: '${weather.humidity}%',
                        ),
                        _weatherDetailItem(
                          icon: FontAwesomeIcons.compressArrowsAlt,
                          label: 'Pressure',
                          value: '${weather.pressure} hPa',
                        ),
                        _weatherDetailItem(
                          icon: FontAwesomeIcons.sun,
                          label: 'Sunrise',
                          value: _formatUnixTime(weather.sunrise),
                        ),
                        _weatherDetailItem(
                          icon: FontAwesomeIcons.moon,
                          label: 'Sunset',
                          value: _formatUnixTime(weather.sunset),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget for individual weather detail
  Widget _weatherDetailItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(12), // Reduced padding
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            icon,
            color: Colors.white,
            size: 28, // Slightly reduced icon size
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12, // Reduced font size
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14, // Reduced font size
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Helper to format Unix time
  String _formatUnixTime(int unixTime) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}