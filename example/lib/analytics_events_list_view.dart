import 'package:analytics_inspector/analytics_inspector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnalyticsEventsListView extends StatelessWidget {
  const AnalyticsEventsListView({
    required this.events,
    super.key,
  });

  final List<AnalyticsEvent> events;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(events[index].name),
        subtitle: Text(events[index].datetime.toString()),
        titleAlignment: ListTileTitleAlignment.center,
        trailing: GestureDetector(
          onTap: () {
            Clipboard.setData(
                ClipboardData(text: events[index].parameters.toString()));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Parameters copied to clipboard!'),
              ),
            );
          },
          child: const Icon(Icons.copy),
        ),
      ),
      itemCount: events.length,
    );
  }
}
