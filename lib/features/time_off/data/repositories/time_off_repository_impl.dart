import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/time_off_type_entity.dart';
import '../../domain/repositories/time_off_repository.dart';
import '../datasources/time_off_remote_data_source.dart';

@Injectable(as: TimeOffRepository)
class TimeOffRepositoryImpl implements TimeOffRepository {
  final TimeOffRemoteDataSource remoteDataSource;

  TimeOffRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, List<TimeOffTypeEntity>>> getTimeOffTypes() async {
    try {
      final types = await remoteDataSource.getTimeOffTypes();
      return Right(types);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, bool>> requestTimeOff({
    required int typeId,
    required String startDate,
    required String endDate,
    required String reason,
  }) async {
    try {
      final success = await remoteDataSource.requestTimeOff(
        typeId: typeId,
        startDate: startDate,
        endDate: endDate,
        reason: reason,
      );
      return Right(success);
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
