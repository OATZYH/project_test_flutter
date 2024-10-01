import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_test_app/bloc/weather_bloc.dart';
import 'package:project_test_app/bloc/weather_event.dart';
import 'package:project_test_app/bloc/weather_state.dart';
import 'package:project_test_app/models/weather.dart';

class WeatherPage extends StatelessWidget {
  final cityController = TextEditingController();

  WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BLoC Weather')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: const InputDecoration(labelText: 'City Name'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final city = cityController.text.trim();
                if (city.isNotEmpty) {
                  // Dispatch FetchWeather event
                  context.read<WeatherBloc>().add(FetchWeather(city));
                } else {
                  // Optionally, show a message if the input is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a city name')),
                  );
                }
              },
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherInitial) {
                    return const Center(
                        child: Text('Enter a city to get weather.'));
                  } else if (state is WeatherLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is WeatherLoaded) {
                    return WeatherDisplay(weather: state.weather);
                  } else if (state is WeatherError) {
                    return Center(child: Text(state.message));
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherDisplay extends StatelessWidget {
  final Weather weather;

  const WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${weather.cityName}: ${weather.temperature}°C',
        style: const TextStyle(fontSize: 32),
      ),
    );
  }
}
