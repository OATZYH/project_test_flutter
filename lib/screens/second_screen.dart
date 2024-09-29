import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Pop the current screen off the stack and return to the first screen
            Navigator.pop(context);
          },
          child: const Text('Go back to First Screen'),
        ),
      ),
    );
  }
}
