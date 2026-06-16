import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/time_off_repository.dart';

@injectable
class RequestTimeOffUseCase {
  final TimeOffRepository repository;

  RequestTimeOffUseCase(this.repository);

  Future<Either<Failures, bool>> call({
    required int typeId,
    required String startDate,
    required String endDate,
    required String reason,
  }) {
    return repository.requestTimeOff(
      typeId: typeId,
      startDate: startDate,
      endDate: endDate,
      reason: reason,
    );
  }
}
