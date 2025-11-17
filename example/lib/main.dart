import 'package:flutter/material.dart';
import 'package:atividade_package/atividade_package.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: SmartInfoWidget(
          weather: "23°C",
          battery: 82,
          steps: 3421,
          heartRate: 76,
        ),
      ),
    );
  }
}
