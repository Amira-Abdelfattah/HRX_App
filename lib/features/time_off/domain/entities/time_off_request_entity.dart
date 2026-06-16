import 'package:equatable/equatable.dart';

class TimeOffRequest extends Equatable {
  final int id;
  final String typeName;
  final String startDate;
  final String endDate;
  final String duration;
  final String status;

  const TimeOffRequest({
    required this.id,
    required this.typeName,
    required this.startDate,
    required this.endDate,
    required this.duration,
    required this.status,
  });

  @override
  List<Object?> get props => [
    id,
    typeName,
    startDate,
    endDate,
    duration,
    status,
  ];
}
