import 'package:analytics_inspector/analytics_inspector.dart';
import 'package:flutter/material.dart';

class AnalyticsUserPropertiesListView extends StatelessWidget {
  const AnalyticsUserPropertiesListView({
    required this.userProperties,
    super.key,
  });

  final List<UserProperty> userProperties;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(userProperties[index].name),
        titleAlignment: ListTileTitleAlignment.center,
        subtitle: Text(userProperties[index].value),
      ),
      itemCount: userProperties.length,
    );
  }
}
