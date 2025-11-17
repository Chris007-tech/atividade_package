import 'package:flutter/material.dart';

class SmartInfoWidget extends StatelessWidget {
  final String weather;
  final int battery;
  final int steps;
  final int heartRate;

  const SmartInfoWidget({
    super.key,
    required this.weather,
    required this.battery,
    required this.steps,
    required this.heartRate,
  });

  Widget _buildItem(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 22),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      children: [
        _buildItem("Clima", weather, Icons.wb_sunny),
        _buildItem("Bateria", "$battery%", Icons.battery_full),
        _buildItem("Passos", "$steps", Icons.directions_walk),
        _buildItem("BPM", "$heartRate", Icons.favorite),
      ],
    );
  }
}
