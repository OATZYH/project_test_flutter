import 'package:flutter/material.dart';
import 'package:project_test_app/bloc/weather_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/first_screen.dart'; // Import the FirstScreen
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:project_test_app/services/weather_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  // await dotenv.load(fileName: ".env");

  // await Supabase.initialize(
  //   url: dotenv.env['SUPABASE_URL']!, // Access the Supabase URL
  //   anonKey: dotenv.env['SUPABASE_ANON_KEY']!, // Access the Supabase anon key
  // );

runApp(
    BlocProvider(
      create: (context) => WeatherBloc(WeatherRepository()),
      child: MyApp(),
    ),
  );
}

// Get a reference your Supabase client
// final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  final WeatherRepository repository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(), // Set FirstScreen as the initial screen
    );
  }
}
