import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/odoo_user_entity.dart';
import '../repositories/payment_repository.dart';

@injectable
class AddOdooUserUseCase {
  final PaymentRepository repository;

  AddOdooUserUseCase(this.repository);

  Future<Either<Failures, OdooUserEntity>> call({
    required String name,
    required String email,
    required String password,
    required String role,
    required String companyName,
  }) {
    return repository.addOdooUser(
      name: name,
      email: email,
      password: password,
      role: role,
      companyName: companyName,
    );
  }
}
