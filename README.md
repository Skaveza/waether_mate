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
## Known Issues

If the UI overflows, ensure your device's font scaling settings or display size adjustments are within normal ranges.

Double-check the API key if the weather data does not load.
## Development Highlights
-**State Management**: The app uses the setState method for managing UI state updates.
-**Error Handling**: Added robust error handling to manage API errors and invalid city inputs.
-**Optimized UI**: Improved designs for weather details and forecast views.
-**No Debug Banner**: Removed the debug banner for a polished user interface.

# API Integration

This app integrates with the OpenWeatherMap API. Below are the main endpoints used:

Current Weather (GET request)

Endpoint: https://api.openweathermap.org/data/2.5/weather


# Contributing

Contributions are welcome! If you'd like to contribute to this project:

Fork the repository.

Create a feature branch: git checkout -b feature-name.

Commit your changes: git commit -m 'Add some feature'.

Push to the branch: git push origin feature-name.

Submit a pull request.

# Acknowledgments
**API**: OpenWeatherMap

**Icons**: Font Awesome Flutter

**Framework**: Flutter
