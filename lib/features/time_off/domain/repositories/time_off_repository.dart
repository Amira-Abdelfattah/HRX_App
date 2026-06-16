import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/time_off_type_entity.dart';

abstract class TimeOffRepository {
  Future<Either<Failures, List<TimeOffTypeEntity>>> getTimeOffTypes();

  Future<Either<Failures, bool>> requestTimeOff({
    required int typeId,
    required String startDate,
    required String endDate,
    required String reason,
  });
}
