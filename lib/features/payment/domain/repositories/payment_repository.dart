import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/odoo_user_entity.dart';

abstract class PaymentRepository {
  Future<Either<Failures, OdooUserEntity>> addOdooUser({
    required String name,
    required String email,
    required String password,
    required String role,
    required String companyName,
  });
}
