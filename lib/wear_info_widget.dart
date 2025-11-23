import 'dart:async';
import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:pedometer/pedometer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WearInfoWidget extends StatefulWidget {
  final String weatherApiKey;
  final String city;

  const WearInfoWidget({
    super.key,
    required this.weatherApiKey,
    required this.city,
  });

  @override
  State<WearInfoWidget> createState() => _WearInfoWidgetState();
}

class _WearInfoWidgetState extends State<WearInfoWidget> {
  final Battery _battery = Battery();

  int batteryLevel = 0;
  int steps = 0;
  int heartRate = 78;
  double temperature = 0;

  StreamSubscription<StepCount>? _stepSub;

  @override
  void initState() {
    super.initState();
    _listenBattery();
    _listenSteps();
    _fetchWeather();
  }

  void _listenBattery() async {
    batteryLevel = await _battery.batteryLevel;
    setState(() {});
  }

  void _listenSteps() {
    _stepSub = Pedometer.stepCountStream.listen((event) {
      setState(() => steps = event.steps);
    });
  }

  Future<void> _fetchWeather() async {
    final url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=${widget.city}&appid=${widget.weatherApiKey}&units=metric",
    );

    final res = await http.get(url);

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      temperature = data["main"]["temp"]?.toDouble() ?? 0;
      setState(() {});
    }
  }

  @override
  void dispose() {
    _stepSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Clima: $temperature°C"),
          Text("Bateria: $batteryLevel%"),
          Text("Passos: $steps"),
          Text("Batimentos: $heartRate bpm"),
        ],
      ),
    );
  }
}
