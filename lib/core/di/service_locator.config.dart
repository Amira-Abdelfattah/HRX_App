// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/payment/data/datasources/payment_remote_data_source.dart'
    as _i811;
import '../../features/payment/data/repositories/payment_repository_impl.dart'
    as _i265;
import '../../features/payment/domain/repositories/payment_repository.dart'
    as _i639;
import '../../features/payment/domain/usecases/add_odoo_user_usecase.dart'
    as _i844;
import '../../features/payment/presentation/manager/payment_view_model.dart'
    as _i502;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i811.PaymentRemoteDataSource>(
      () => _i811.PaymentRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i639.PaymentRepository>(
      () => _i265.PaymentRepositoryImpl(gh<_i811.PaymentRemoteDataSource>()),
    );
    gh.factory<_i844.AddOdooUserUseCase>(
      () => _i844.AddOdooUserUseCase(gh<_i639.PaymentRepository>()),
    );
    gh.factory<_i502.PaymentViewModel>(
      () => _i502.PaymentViewModel(gh<_i844.AddOdooUserUseCase>()),
    );
    return this;
  }
}
