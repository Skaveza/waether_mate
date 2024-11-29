# WeatherMate

WeatherMate is a mobile weather application built with Flutter. It allows users to check current weather details, view extended information about a city, and access a 7-day weather forecast using the OpenWeatherMap API.

## Features
- **Search by City**: Enter any city's name to get real-time weather details.
- **Current Weather Details**: Displays temperature, humidity, wind speed, pressure, and weather description.
- **Detailed Weather View**: Access additional information such as sunrise, sunset, and weather conditions in a visually appealing format.
- **7-Day Forecast**: Provides a forecast for the next 7 days for the entered city.

---

## Screens
1. **Home Screen**
    - Search bar for entering the city name.
    - Displays current weather conditions: temperature, humidity, wind speed, and pressure.
    - Navigation options to access detailed weather data or the 7-day forecast.

2. **Details Screen**
    - Provides a comprehensive view of the selected city's weather, including:
        - Sunrise and sunset times.
        - Temperature, humidity, wind speed, and pressure.
        - Icon-based representation for better visuals.

3. **Forecast Screen**
    - Lists the 7-day weather forecast.
    - Displays daily highs, lows, and weather conditions.

---

## Technologies Used
- **Flutter**: Framework for building the application.
- **OpenWeatherMap API**: Provides the weather data.
- **Font Awesome Flutter**: For beautiful and meaningful weather icons.
- **State Management**: Handled with simple `setState` for managing the app's UI states.
## Getting Started

# Prerequisites
To run this project, you'll need to have the following installed:

Flutter SDK

Android Studio or Visual Studio Code (with Flutter & Dart extensions)

OpenWeatherMap API Key

# Installation
Clone the repository:

```bash
 Copy code
git clone https://github.com/your-username/weather_mate.git
cd weather_mate
Install dependencies: In the project root directory, run:
```
```bash
Copy code
flutter pub get
```
Set up the OpenWeatherMap API:

Sign up for an API key at OpenWeatherMap.

In the project, locate the API configuration file and add your API key.

Run the app:

Make sure you have an Android/iOS emulator running or a physical device connected.
Run the following command:
```bash
Copy code
flutter run
```
# Dependencies

**http**: For making HTTP requests to the OpenWeatherMap API.

**geolocator**: To get the user's location for weather updates.

**provider**: To manage and share app state across different screens.

**flutter_svg**: For displaying weather icons in SVG format.

# API Integration

This app integrates with the OpenWeatherMap API. Below are the main endpoints used:

Current Weather (GET request)

Endpoint: https://api.openweathermap.org/data/2.5/weather

Query Parameters:

q (city name)

lat and lon (latitude and longitude, for geolocation)

units (metric or imperial for Celsius/Fahrenheit)

7-Day Forecast (GET request)

Endpoint: https://api.openweathermap.org/data/2.5/onecall

Query Parameters:

lat and lon (latitude and longitude)

exclude (current, minutely, hourly, daily - depending on what is needed)

Hourly Forecast (GET request)

Endpoint: https://api.openweathermap.org/data/2.5/forecast

Query Parameters:

q (city name)

units (metric or imperial)

Challenges & Solutions

Geolocation Permissions:

Challenge: Handling location permissions on both iOS and Android.

Solution: Used the geolocator package and handled permission requests for both platforms properly.

API Rate Limits:

Challenge: OpenWeatherMap's free tier has limited API calls.

Solution: Implemented a caching system to store weather data locally and reduce the number of API requests.

Responsive UI Design:

Challenge: Ensuring the UI adapts well to different screen sizes.

Solution: Used Flutter's MediaQuery and layout widgets like Expanded and Flexible to ensure responsiveness.

# Contributing

Feel free to fork this repository and submit pull requests. If you encounter any issues, open an issue in the GitHub repository.

# License

This project is licensed under the MIT License - see the LICENSE file for details.

# Acknowledgments

OpenWeatherMap API for providing the weather data.

Flutter Team for creating a great cross-platform development framework.

Geolocator Package for easy location fetching.

Provider Package for effective state management in Flutter.
