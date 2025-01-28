import 'package:analytics_inspector/analytics_inspector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  tearDown(
    () {
      AnalyticsInspector.instance.clear();
    },
  );

  test(
    'should add an event when logEvent is called',
    () {
      final inspector = AnalyticsInspector.instance;

      inspector.logEvent('event1', {});

      final events = inspector.events;
      expect(events.value.where((event) => event.name == 'event1'), isNotEmpty);
    },
  );

  test(
    'should add a screen event when logScreenEvent is called',
    () {
      final inspector = AnalyticsInspector.instance;

      inspector.logScreenEvent('screen1', {});

      final screenEvents = inspector.screenEvents;
      expect(screenEvents.value.where((event) => event.screeName == 'screen1'), isNotEmpty);
    },
  );

  test(
    'should clear all the events after clear is called',
    () {
      final inspector = AnalyticsInspector.instance;

      inspector.logEvent('event1', {});
      inspector.logScreenEvent('screen1', {});
      inspector.clear();

      final events = inspector.events;
      final screenEvents = inspector.screenEvents;
      expect(events.value, isEmpty);
      expect(screenEvents.value, isEmpty);
    },
  );
}
