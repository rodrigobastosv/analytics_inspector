import 'package:analytics_inspector/analytics_inspector.dart';
import 'analytics_events_list_view.dart';
import 'analytics_screen_events_list_view.dart';
import 'package:flutter/material.dart';

class AnalyticsInspectorWidget extends StatefulWidget {
  const AnalyticsInspectorWidget({
    super.key,
  });

  @override
  State<AnalyticsInspectorWidget> createState() =>
      _AnalyticsInspectorWidgetState();
}

class _AnalyticsInspectorWidgetState extends State<AnalyticsInspectorWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final Stream<List<AnalyticsEvent>> _eventsStream;
  late final Stream<List<AnalyticsScreenEvent>> _screenEventsStream;

  List<AnalyticsEvent> _events = [];
  List<AnalyticsScreenEvent> _screenEvents = [];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _eventsStream = AnalyticsInspector.instance.events;
    _screenEventsStream = AnalyticsInspector.instance.screenEvents;

    _eventsStream.listen(
      (events) {
        setState(() => _events = events);
      },
    );

    _screenEventsStream.listen(
      (events) {
        setState(() => _screenEvents = events);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => AnalyticsInspector.instance.clear(),
        ),
        title: const Text('Inspector'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Events'),
            Tab(text: 'Screen Events'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AnalyticsEventsListView(events: _events),
          AnalyticsScreenEventsListView(events: _screenEvents),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          if (_tabController.index == 0) {
            AnalyticsInspector.instance.logEvent('name', {});
          } else {
            AnalyticsInspector.instance.logScreenEvent('screen', {});
          }
        },
      ),
    );
  }
}
