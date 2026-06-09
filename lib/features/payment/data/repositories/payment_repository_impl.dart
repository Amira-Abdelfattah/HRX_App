import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/odoo_user_entity.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasources/payment_remote_data_source.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;

  PaymentRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, OdooUserEntity>> addOdooUser({
    required String name,
    required String email,
    required String password,
    required String role,
    required String companyName,
  }) async {
    try {
      final response = await remoteDataSource.addOdooUser(
        name: name,
        email: email,
        password: password,
        role: role,
        companyName: companyName,
      );
      
      if (response.result?.status == "success") {
        return Right(response.result!.toEntity());
      } else {
        return Left(Failures(errorMessage: "Odoo Registration Failed"));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
