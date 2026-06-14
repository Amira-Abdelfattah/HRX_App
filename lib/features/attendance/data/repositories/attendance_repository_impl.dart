import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/attendance_repository.dart';
import '../datasources/attendance_remote_data_source.dart';
import '../models/attendance_response_model.dart';

@Injectable(as: AttendanceRepository)
class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceRemoteDataSource remoteDataSource;

  AttendanceRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, AttendanceResponseModel>> checkIn(
    int employeeId,
  ) async {
    try {
      final result = await remoteDataSource.checkIn(employeeId);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, AttendanceResponseModel>> checkOut(
    int employeeId,
  ) async {
    try {
      final result = await remoteDataSource.checkOut(employeeId);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
