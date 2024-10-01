import '../models/weather.dart'; // Weather model
import 'dart:convert';
import 'package:dio/dio.dart';

class WeatherRepository {
  Future<Weather> getWeather(String cityName) async {
    // fetch data from API
    final String apiKey = '1af0578e88394077ba8210010240110';
    final String url =
        'https://api.weatherapi.com/v1/current.json?q=${cityName}&key=$apiKey';
    final Dio dio = Dio();
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        return Weather(
          cityName: data['location']['name'],
          temperature: data['current']['temp_c'].toDouble(),
        );
      } else {
        throw Exception("Failed to load weather data");
      }
    } catch (e) {
      print(e.toString());
      throw Exception("Error fetching weather: ${e.toString()}");
    }
  }
}
