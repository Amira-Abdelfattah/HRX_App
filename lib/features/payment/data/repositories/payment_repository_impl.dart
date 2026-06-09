import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/odoo_user_entity.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasources/payment_remote_data_source.dart';
import '../models/odoo_user_response.dart';

@LazySingleton(as: PaymentRepository)
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

      if (response.error != null) {
        return Left(Failures(errorMessage: _extractOdooErrorMessage(response)));
      }

      if (response.result != null) {
        final result = response.result!;
        if (result.status?.toLowerCase() == 'success' ||
            result.userId != null) {
          return Right(result.toEntity());
        }
      }

      return Left(Failures(
        errorMessage:
        'Registration failed. Please check your email and company details.',
      ));
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  String _extractOdooErrorMessage(OdooUserResponse response) {
    final error = response.error!;
    if (error.data != null) {
      if (error.data is Map<String, dynamic>) {
        final data = error.data as Map<String, dynamic>;
        if (data['message'] != null) {
          return data['message'].toString();
        }
        if (data['debug'] != null) {
          return data['debug'].toString();
        }
      }
      return error.data.toString();
    }
    return error.message ??
        'Registration failed. Please check your email and company details.';
  }
}
