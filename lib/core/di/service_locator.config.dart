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

import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_use_case.dart' as _i37;
import '../../features/auth/domain/usecases/register_use_case.dart' as _i97;
import '../../features/auth/presentation/manager/login_view_model.dart'
    as _i608;
import '../../features/auth/presentation/manager/register_view_model.dart'
    as _i781;
import '../../features/employees/data/datasources/employees_remote_data_source.dart'
    as _i345;
import '../../features/employees/data/repositories/employees_repository_impl.dart'
    as _i599;
import '../../features/employees/domain/repositories/employees_repository.dart'
    as _i24;
import '../../features/employees/domain/usecases/add_employee_use_case.dart'
    as _i811;
import '../../features/employees/domain/usecases/get_employees_use_case.dart'
    as _i229;
import '../../features/employees/presentation/manager/add_employee_view_model.dart'
    as _i488;
import '../../features/employees/presentation/manager/employees_view_model.dart'
    as _i477;
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
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.lazySingleton<_i811.PaymentRemoteDataSource>(
      () => _i811.PaymentRemoteDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.factory<_i345.EmployeesRemoteDataSource>(
      () => _i345.EmployeesRemoteDataSourceImpl(gh<_i1047.ApiManager>()),
    );
    gh.lazySingleton<_i639.PaymentRepository>(
      () => _i265.PaymentRepositoryImpl(gh<_i811.PaymentRemoteDataSource>()),
    );
    gh.factory<_i24.EmployeesRepository>(
      () =>
          _i599.EmployeesRepositoryImpl(gh<_i345.EmployeesRemoteDataSource>()),
    );
    gh.factory<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(gh<_i107.AuthRemoteDataSource>()),
    );
    gh.factory<_i844.AddOdooUserUseCase>(
      () => _i844.AddOdooUserUseCase(gh<_i639.PaymentRepository>()),
    );
    gh.factory<_i502.PaymentViewModel>(
      () => _i502.PaymentViewModel(gh<_i844.AddOdooUserUseCase>()),
    );
    gh.factory<_i37.LoginUseCase>(
      () => _i37.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i97.RegisterUseCase>(
      () => _i97.RegisterUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i811.AddEmployeeUseCase>(
      () => _i811.AddEmployeeUseCase(gh<_i24.EmployeesRepository>()),
    );
    gh.factory<_i229.GetEmployeesUseCase>(
      () => _i229.GetEmployeesUseCase(gh<_i24.EmployeesRepository>()),
    );
    gh.factory<_i781.RegisterViewModel>(
      () => _i781.RegisterViewModel(gh<_i97.RegisterUseCase>()),
    );
    gh.factoryParam<_i608.LoginViewModel, String?, String?>(
      (initialEmail, initialPassword) => _i608.LoginViewModel(
        gh<_i37.LoginUseCase>(),
        initialEmail: initialEmail,
        initialPassword: initialPassword,
      ),
    );
    gh.factory<_i477.EmployeesViewModel>(
      () => _i477.EmployeesViewModel(gh<_i229.GetEmployeesUseCase>()),
    );
    gh.factory<_i488.AddEmployeeViewModel>(
      () => _i488.AddEmployeeViewModel(gh<_i811.AddEmployeeUseCase>()),
    );
    return this;
  }
}
