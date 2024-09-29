import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'Login.dart';
import 'Register.dart';

const String url1 = 'https://jsonplaceholder.typicode.com/posts/1';
const String url2 = 'https://dummyjson.com/quotes/1';

class ApiService {
  final Dio _dio = Dio();

  Future<String> fetchData(String url) async {
    try {
      final response = await _dio.get(url);
      if (response.data['quote'] != null) {
        return response.data['quote'];
      } else if (response.data['title'] != null) {
        return response.data['title'];
      } else {
        return 'No data';
      }
    } on DioException catch (dioError) {
      return 'Error: ${dioError.response?.statusCode ?? 'Unknown'} - ${dioError.message}';
    } catch (error) {
      return 'Error: $error';
    }
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FirstScreen> {
  String _data = '';
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  Future<void> fetchData({required String url}) async {
    setState(() {
      _isLoading = true; // Start loading
    });

    String result = await _apiService.fetchData(url);

    setState(() {
      _data = result;
      _isLoading = false; // Stop loading
    });
  }

  @override
  void initState() {
    super.initState();
    _data = 'No data';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text('Test dio package'),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator() // Show loading indicator while loading
                  : Text('Data: $_data'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => fetchData(url: url1),
                child: const Text('Fetch 1'),
              ),
              ElevatedButton(
                  onPressed: () => fetchData(url: url2),
                  child: const Text('Fetch 2')),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondScreen()),
                  );
                },
                child: const Text('Go to Second Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the third screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SimpleLoginScreen()),
                  );
                },
                child: const Text('Go to Login Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the fourth screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SimpleRegisterScreen()),
                  );
                },
                child: const Text('Go to Register Screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
