import 'package:analytics_inspector/analytics_inspector.dart';
import 'package:example/analytics_inspector_widget.dart';
import 'package:flutter/material.dart';

final events = List.generate(
  20,
  (index) => AnalyticsEvent(
    datetime: DateTime.now().toLocal(),
    name: 'event name $index',
    parameters: {'event_parameter': index},
  ),
);

final screenEvents = List.generate(
  20,
  (index) => AnalyticsScreenEvent(
    datetime: DateTime.now().toLocal(),
    screeName: 'screen name $index',
    parameters: {'screen_parameter': index},
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AnalyticsInspectorWidget(),
    );
  }
}
