import '../../domain/entities/time_off_type_entity.dart';

class TimeOffTypeModel extends TimeOffTypeEntity {
  const TimeOffTypeModel({
    required super.id,
    required super.displayName,
    super.virtualRemainingLeaves,
  });

  factory TimeOffTypeModel.fromJson(Map<String, dynamic> json) {
    return TimeOffTypeModel(
      id: json['id'],
      displayName: json['display_name'],
      virtualRemainingLeaves: (json['virtual_remaining_leaves'] ?? 0.0)
          .toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'display_name': displayName,
      'virtual_remaining_leaves': virtualRemainingLeaves,
    };
  }
}

class TimeOffTypesResponse {
  final String status;
  final List<TimeOffTypeModel> data;

  TimeOffTypesResponse({required this.status, required this.data});

  factory TimeOffTypesResponse.fromJson(Map<String, dynamic> json) {
    final result = json['result'];
    return TimeOffTypesResponse(
      status: result['status'],
      data: (result['data'] as List)
          .map((e) => TimeOffTypeModel.fromJson(e))
          .toList(),
    );
  }
}
