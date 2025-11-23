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
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: SmartInfoControllerWidget(),
          ),
        ),
      ),
    );
  }
}
