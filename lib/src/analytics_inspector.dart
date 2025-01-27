import 'dart:async';

import 'package:analytics_inspector/src/entities/analytics_event.dart';
import 'package:analytics_inspector/src/entities/analytics_screen_event.dart';

class AnalyticsInspector {
  AnalyticsInspector._();

  static AnalyticsInspector instance = AnalyticsInspector._();

  final List<AnalyticsEvent> _events = [];
  final List<AnalyticsScreenEvent> _screenEvents = [];

  final StreamController<List<AnalyticsEvent>> _eventsStreamController =
      StreamController<List<AnalyticsEvent>>();
  final StreamController<List<AnalyticsScreenEvent>>
      _screenEventsStreamController =
      StreamController<List<AnalyticsScreenEvent>>();

  Stream<List<AnalyticsEvent>> get events => _eventsStreamController.stream;
  Stream<List<AnalyticsScreenEvent>> get screenEvents =>
      _screenEventsStreamController.stream;

  void logEvent(String name, Map<String, dynamic> parameters) {
    final datetime = DateTime.now().toLocal();
    final event = AnalyticsEvent(
      datetime: datetime,
      name: name,
      parameters: parameters,
    );
    _events.add(event);
    _eventsStreamController.sink.add(_events);
  }

  void logScreenEvent(String screeName, Map<String, dynamic> parameters) {
    final datetime = DateTime.now().toLocal();
    final event = AnalyticsScreenEvent(
      datetime: datetime,
      screeName: screeName,
      parameters: parameters,
    );
    _screenEvents.add(event);
    _screenEventsStreamController.sink.add(_screenEvents);
  }

  void clear() {
    _events.clear();
    _screenEvents.clear();
    _eventsStreamController.sink.add(_events);
    _screenEventsStreamController.sink.add(_screenEvents);
  }
}
