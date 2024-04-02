import 'package:dio_study/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  static const String apiUrl = "https://jsonplaceholder.typicode.com/todos/1";
  String todo = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final response = await dio.get(apiUrl);
                  setState(() {
                    todo = response.data.toString();
                  });
                },
                child: const Text('GET TODO'),
              ),
              Text(
                'TODO: $todo',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
