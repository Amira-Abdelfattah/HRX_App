import 'package:dartz/dartz.dart';

import '../../data/models/attendance_response_model.dart';

abstract class AttendanceRepository {
  Future<Either<String, AttendanceResponseModel>> checkIn(int employeeId);

  Future<Either<String, AttendanceResponseModel>> checkOut(int employeeId);
}
