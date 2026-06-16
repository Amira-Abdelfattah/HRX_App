import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/time_off_type_entity.dart';
import '../repositories/time_off_repository.dart';

@injectable
class GetTimeOffTypesUseCase {
  final TimeOffRepository repository;

  GetTimeOffTypesUseCase(this.repository);

  Future<Either<Failures, List<TimeOffTypeEntity>>> call() {
    return repository.getTimeOffTypes();
  }
}
