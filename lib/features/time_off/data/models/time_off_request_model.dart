import '../../domain/entities/time_off_request_entity.dart';

class TimeOffRequestModel extends TimeOffRequest {
  const TimeOffRequestModel({
    required super.id,
    required super.typeName,
    required super.startDate,
    required super.endDate,
    required super.duration,
    required super.status,
  });

  factory TimeOffRequestModel.fromJson(Map<String, dynamic> json) {
    return TimeOffRequestModel(
      id: json['id'],
      typeName: json['holiday_status_id']?[1] ?? 'Unknown',
      startDate: json['date_from'] ?? '',
      endDate: json['date_to'] ?? '',
      duration: '${json['number_of_days'] ?? 0} days',
      status: _mapStatus(json['state']),
    );
  }

  static String _mapStatus(String? state) {
    switch (state) {
      case 'confirm':
        return 'To Approve';
      case 'refuse':
        return 'Refused';
      case 'validate':
        return 'Approved';
      case 'cancel':
        return 'Cancelled';
      default:
        return 'Draft';
    }
  }
}

class TimeOffRequestsResponse {
  final String status;
  final List<TimeOffRequestModel> data;

  TimeOffRequestsResponse({required this.status, required this.data});

  factory TimeOffRequestsResponse.fromJson(Map<String, dynamic> json) {
    final result = json['result'];
    return TimeOffRequestsResponse(
      status: result['status'] ?? 'success',
      data: (result['data'] as List? ?? [])
          .map((e) => TimeOffRequestModel.fromJson(e))
          .toList(),
    );
  }
}
