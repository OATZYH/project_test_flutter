// weather_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_test_app/bloc/weather_event.dart';
import 'package:project_test_app/bloc/weather_state.dart';
import 'package:project_test_app/models/weather.dart';
import 'package:project_test_app/services/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc(this.repository) : super(WeatherInitial()) {
    // Register the event handler for FetchWeather
    on<FetchWeather>(_onFetchWeather);
  }

  // Event handler for FetchWeather
  Future<void> _onFetchWeather(
      FetchWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      // Fetch weather data from the repository
      final Weather weather = await repository.getWeather(event.cityName);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError("Failed to fetch weather: ${e.toString()}"));
    }
  }
}
