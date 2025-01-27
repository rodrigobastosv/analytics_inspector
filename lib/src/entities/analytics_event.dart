import 'package:equatable/equatable.dart';

class AnalyticsEvent extends Equatable {
  const AnalyticsEvent({
    required this.datetime,
    required this.name,
    required this.parameters,
  });

  final DateTime datetime;
  final String name;
  final Map<String, dynamic> parameters;

  @override
  List<Object?> get props => [
        name,
        parameters,
      ];
}
