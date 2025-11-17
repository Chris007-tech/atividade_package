import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atividade_package/atividade_package.dart';

void main() {
  testWidgets('Widget exibe os valores corretamente', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SmartInfoWidget(
          weather: "20°C",
          battery: 50,
          steps: 1200,
          heartRate: 72,
        ),
      ),
    );

    expect(find.text("20°C"), findsOneWidget);
    expect(find.text("50%"), findsOneWidget);
    expect(find.text("1200"), findsOneWidget);
    expect(find.text("72"), findsOneWidget);
  });
}
