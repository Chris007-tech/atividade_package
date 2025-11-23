import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'smart_info_widget.dart';

class SmartInfoControllerWidget extends StatefulWidget {
  const SmartInfoControllerWidget({super.key});

  @override
  State<SmartInfoControllerWidget> createState() =>
      _SmartInfoControllerWidgetState();
}

class _SmartInfoControllerWidgetState extends State<SmartInfoControllerWidget> {
  final Battery _battery = Battery();

  int batteryLevel = 0;
  int steps = 0;
  int heartRate = 0;
  String weather = "--";

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    batteryLevel = await _battery.batteryLevel;

    steps = 0;
    heartRate = 0;

    weather = "--";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SmartInfoWidget(
      weather: weather,
      battery: batteryLevel,
      steps: steps,
      heartRate: heartRate,
    );
  }
}
