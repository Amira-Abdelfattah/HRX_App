class AttendanceResponseModel {
  final String status;
  final String message;
  final int? attendanceId;
  final String? checkIn;
  final String? checkOut;
  final double? workedHours;

  AttendanceResponseModel({
    required this.status,
    required this.message,
    this.attendanceId,
    this.checkIn,
    this.checkOut,
    this.workedHours,
  });

  factory AttendanceResponseModel.fromJson(Map<String, dynamic> json) {
    return AttendanceResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      attendanceId: json['attendance_id'],
      checkIn: json['check_in'],
      checkOut: json['check_out'],
      workedHours: (json['worked_hours'] as num?)?.toDouble(),
    );
  }
}
