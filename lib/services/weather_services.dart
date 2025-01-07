import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    final apiKey = dotenv.env['api_key'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception("API key is not set");
    }
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&days=1&q=$cityName');
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
          e.response?.data['error']['message'] ?? 'oops something went wrong');
    } catch (e) {
      log(e.toString());
      throw Exception('oops something went wrong');
    }
  }
}
