import 'package:analytics_inspector/analytics_inspector.dart';
import 'analytics_events_list_view.dart';
import 'analytics_screen_events_list_view.dart';
import 'package:flutter/material.dart';

class AnalyticsInspectorWidget extends StatefulWidget {
  const AnalyticsInspectorWidget({
    super.key,
  });

  @override
  State<AnalyticsInspectorWidget> createState() => _AnalyticsInspectorWidgetState();
}

class _AnalyticsInspectorWidgetState extends State<AnalyticsInspectorWidget> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
          ValueListenableBuilder(
            valueListenable: AnalyticsInspector.instance.events,
            builder: (context, events, child) => AnalyticsEventsListView(events: events),
          ),
          ValueListenableBuilder(
            valueListenable: AnalyticsInspector.instance.screenEvents,
            builder: (context, events, child) => AnalyticsScreenEventsListView(events: events),
          ),
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
