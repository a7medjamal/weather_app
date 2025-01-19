import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: getWeatherColor(condition: ),
          ),
        ),
        home: const HomeView(),
      ),
    );
  }

  Color getWeatherColor({required String condition}) {
    switch (condition) {
      case "Sunny":
        return Color(0xFFFFD700);
      case "Partly cloudy":
        return Color(0xFFB0C4DE);
      case "Cloudy":
        return Color(0xFF808080);
      case "Overcast":
        return Color(0xFF595959);
      case "Mist":
        return Color(0xFFD3D3D3);
      case "Patchy rain possible":
        return Color(0xFF00BFFF);
      case "Patchy snow possible":
        return Color(0xFFB0E0E6);
      case "Patchy sleet possible":
        return Color(0xFF4682B4);
      case "Patchy freezing drizzle possible":
        return Color(0xFF5F9EA0);
      case "Thundery outbreaks possible":
        return Color(0xFFFF6347);
      case "Blowing snow":
        return Color(0xFFFFFFFF);
      case "Blizzard":
        return Color(0xFF708090);
      case "Fog":
        return Color(0xFFBEBEBE);
      case "Freezing fog":
        return Color(0xFFD3D3D3);
      case "Patchy light drizzle":
        return Color(0xFFADD8E6);
      case "Light drizzle":
        return Color(0xFFB0E0E6);
      case "Freezing drizzle":
        return Color(0xFF00CED1);
      case "Heavy freezing drizzle":
        return Color(0xFF20B2AA);
      case "Patchy light rain":
        return Color(0xFF4682B4);
      case "Light rain":
        return Color(0xFF00CED1);
      case "Moderate rain at times":
        return Color(0xFF1E90FF);
      case "Moderate rain":
        return Color(0xFF0000CD);
      case "Heavy rain at times":
        return Color(0xFF00008B);
      case "Heavy rain":
        return Color(0xFF000080);
      case "Light freezing rain":
        return Color(0xFFAFEEEE);
      case "Moderate or heavy freezing rain":
        return Color(0xFF4682B4);
      case "Light sleet":
        return Color(0xFF5F9EA0);
      case "Moderate or heavy sleet":
        return Color(0xFF4682B4);
      case "Patchy light snow":
        return Color(0xFFF0FFFF);
      case "Light snow":
        return Color(0xFFF8F8FF);
      case "Patchy moderate snow":
        return Color(0xFFDCDCDC);
      case "Moderate snow":
        return Color(0xFFB0C4DE);
      case "Patchy heavy snow":
        return Color(0xFFADD8E6);
      case "Heavy snow":
        return Color(0xFFFFFFFF);
      case "Ice pellets":
        return Color(0xFFB0E0E6);
      case "Light rain shower":
        return Color(0xFF87CEEB);
      case "Moderate or heavy rain shower":
        return Color(0xFF4682B4);
      case "Torrential rain shower":
        return Color(0xFF00008B);
      case "Light sleet showers":
        return Color(0xFFB0E0E6);
      case "Moderate or heavy sleet showers":
        return Color(0xFF4682B4);
      case "Light snow showers":
        return Color(0xFFF0FFFF);
      case "Moderate or heavy snow showers":
        return Color(0xFFDCDCDC);
      case "Light showers of ice pellets":
        return Color(0xFFB0E0E6);
      case "Moderate or heavy showers of ice pellets":
        return Color(0xFF4682B4);
      case "Patchy light rain with thunder":
        return Color(0xFFFF4500);
      case "Moderate or heavy rain with thunder":
        return Color(0xFFFF0000);
      case "Patchy light snow with thunder":
        return Color(0xFFFFA500);
      case "Moderate or heavy snow with thunder":
        return Color(0xFFFF6347);
      default:
        return Color(0xFF808080);
    }
  }
}
