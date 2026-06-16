import 'package:equatable/equatable.dart';

class TimeOffTypeEntity extends Equatable {
  final int id;
  final String displayName;
  final double virtualRemainingLeaves;

  const TimeOffTypeEntity({
    required this.id,
    required this.displayName,
    this.virtualRemainingLeaves = 0.0,
  });

  @override
  List<Object?> get props => [id, displayName, virtualRemainingLeaves];
}
