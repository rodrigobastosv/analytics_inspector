import 'package:equatable/equatable.dart';

class UserProperty extends Equatable {
  const UserProperty({required this.name, required this.value});

  final String name;
  final String value;

  @override
  List<Object?> get props => [name, value];
}
