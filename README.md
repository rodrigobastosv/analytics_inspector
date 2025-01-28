<a href="https://www.buymeacoffee.com/rodrigobastosv" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

A simple inspector to plug to your analytics events to help debugging them without needing Debug View

## Features

Whoever worked with Firebase Analytics Debug View knows how much it sucks. In most of the cases we just need a straight forward way of knowing if our events are being sent or not.

This package adds this thin layer that can be plugged to your analytics and you can use the data to determine if the correct events and parameters are being sent.

## Getting started

Using this is as simple as adding events or screen events:

```dart
AnalyticsInspector.instance.logEvent(
        'my_event_name', {
        'parameter1': 'value1',
    },
);
```

```dart
AnalyticsInspector.instance.logScreenEvent(
        'screen_name', {
        'parameter1': 'value1',
    },
);
```

The package them exposes 2 Lists for working with both Events and Screen Events:

```dart
final events = AnalyticsInspector.instance.events;
final screenEvents = AnalyticsInspector.instance.screenEvents;
```

The package is not opinionated on how this information should be displayed. The Lists are exposed and is up to you to display the way you want it.