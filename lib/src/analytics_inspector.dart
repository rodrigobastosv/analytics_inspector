import 'package:analytics_inspector/src/entities/analytics_event.dart';
import 'package:analytics_inspector/src/entities/analytics_screen_event.dart';
import 'package:analytics_inspector/src/entities/user_property.dart';
import 'package:flutter/material.dart';

class AnalyticsInspector {
  AnalyticsInspector._();

  static AnalyticsInspector instance = AnalyticsInspector._();

  final ValueNotifier<List<UserProperty>> userProperties =
      ValueNotifier<List<UserProperty>>([]);
  final ValueNotifier<List<AnalyticsEvent>> events =
      ValueNotifier<List<AnalyticsEvent>>([]);
  final ValueNotifier<List<AnalyticsScreenEvent>> screenEvents =
      ValueNotifier<List<AnalyticsScreenEvent>>([]);

  void setUserProperty(String name, String value) {
    final userProperty = UserProperty(name: name, value: value);
    userProperties.value = [
      ...userProperties.value,
      userProperty,
    ];
  }

  void logEvent(String name, Map<String, dynamic> parameters) {
    final datetime = DateTime.now().toLocal();
    final event = AnalyticsEvent(
      datetime: datetime,
      name: name,
      parameters: parameters,
    );
    events.value = [
      ...events.value,
      event,
    ];
  }

  void logScreenEvent(String screeName, Map<String, dynamic> parameters) {
    final datetime = DateTime.now().toLocal();
    final event = AnalyticsScreenEvent(
      datetime: datetime,
      screeName: screeName,
      parameters: parameters,
    );
    screenEvents.value = [
      ...screenEvents.value,
      event,
    ];
  }

  void clear() {
    events.value = [];
    screenEvents.value = [];
  }
}
