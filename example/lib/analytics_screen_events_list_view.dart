import 'package:analytics_inspector/analytics_inspector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnalyticsScreenEventsListView extends StatelessWidget {
  const AnalyticsScreenEventsListView({
    required this.events,
    super.key,
  });

  final List<AnalyticsScreenEvent> events;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(events[index].screeName),
        titleAlignment: ListTileTitleAlignment.center,
        subtitle: Text(events[index].datetime.toString()),
        trailing: GestureDetector(
          onTap: () {
            final parameters = events[index].parameters;
            if (parameters != null) {
              Clipboard.setData(ClipboardData(text: parameters.toString()));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Parameters copied to clipboard!'),
                ),
              );
            }
          },
          child: const Icon(Icons.copy),
        ),
      ),
      itemCount: events.length,
    );
  }
}
