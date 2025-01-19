import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
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
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: getWeatherColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition),
                ),
              ),
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) return Colors.blue;
  switch (condition) {
    case "Sunny":
      return Colors.yellow;
    case "Partly cloudy":
      return Colors.blueGrey;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
    case "Mist":
      return Colors.blueGrey;
    case "Patchy rain possible":
      return Colors.lightBlue;
    case "Patchy snow possible":
      return Colors.cyan;
    case "Patchy sleet possible":
      return Colors.indigo;
    case "Patchy freezing drizzle possible":
      return Colors.blue;
    case "Thundery outbreaks possible":
      return Colors.deepOrange;
    case "Blowing snow":
    case "Blizzard":
      return Colors.blueGrey;
    case "Fog":
      return Colors.grey;
    case "Freezing fog":
    case "Patchy light drizzle":
      return Colors.blueGrey;
    case "Light drizzle":
    case "Freezing drizzle":
      return Colors.lightBlue;
    case "Heavy freezing drizzle":
    case "Patchy light rain":
      return Colors.lightBlue;
    case "Light rain":
      return Colors.blue;
    case "Moderate rain at times":
      return Colors.blue;
    case "Moderate rain":
    case "Heavy rain at times":
      return Colors.blueGrey;
    case "Heavy rain":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.blueGrey;
    case "Light sleet":
      return Colors.indigo;
    case "Moderate or heavy sleet":
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Ice pellets":
      return Colors.blueGrey;
    case "Light rain shower":
      return Colors.lightBlue;
    case "Moderate or heavy rain shower":
      return Colors.blue;
    case "Torrential rain shower":
    case "Light sleet showers":
      return Colors.indigo;
    case "Moderate or heavy sleet showers":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
    case "Light showers of ice pellets":
      return Colors.blueGrey;
    case "Moderate or heavy showers of ice pellets":
      return Colors.blueGrey;
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.deepOrange;
    case "Patchy light snow with thunder":
      return Colors.orange;
    case "Moderate or heavy snow with thunder":
    default:
      return Colors.grey;
  }
}
