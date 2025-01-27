import 'package:equatable/equatable.dart';

class AnalyticsScreenEvent extends Equatable {
  const AnalyticsScreenEvent({
    required this.datetime,
    required this.screeName,
    this.parameters,
  });

  final DateTime datetime;
  final String screeName;
  final Map<String, dynamic>? parameters;

  @override
  List<Object?> get props => [
        screeName,
        parameters,
      ];
}
