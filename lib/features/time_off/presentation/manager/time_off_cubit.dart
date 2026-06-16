import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../employees/domain/usecases/get_employees_use_case.dart';
import '../../domain/entities/time_off_request_entity.dart';
import '../../domain/usecases/get_time_off_types_use_case.dart';
import '../../domain/usecases/request_time_off_use_case.dart';
import 'time_off_states.dart';

@injectable
class TimeOffCubit extends Cubit<TimeOffStates> {
  final GetTimeOffTypesUseCase getTimeOffTypesUseCase;
  final GetEmployeesUseCase getEmployeesUseCase;
  final RequestTimeOffUseCase requestTimeOffUseCase;

  TimeOffCubit(
    this.getTimeOffTypesUseCase,
    this.getEmployeesUseCase,
    this.requestTimeOffUseCase,
  ) : super(TimeOffInitialState());

  Future<void> loadTimeOffData() async {
    emit(TimeOffLoadingState());

    final typesResult = await getTimeOffTypesUseCase();
    final employeesResult = await getEmployeesUseCase();

    typesResult.fold(
      (failure) => emit(TimeOffErrorState(failure.errorMessage)),
      (types) {
        employeesResult.fold(
          (failure) => emit(TimeOffErrorState(failure.errorMessage)),
          (employees) => emit(
            TimeOffSuccessState(
              types: types,
              employees: employees,
              myRequests: _localRequests,
            ),
          ),
        );
      },
    );
  }

  final List<TimeOffRequest> _localRequests = [];

  Future<void> requestTimeOff({
    required int typeId,
    required String typeName,
    required String startDate,
    required String endDate,
    required String reason,
  }) async {
    final currentState = state;
    if (currentState is TimeOffSuccessState) {
      emit(TimeOffRequestLoadingState());
      final result = await requestTimeOffUseCase(
        typeId: typeId,
        startDate: startDate,
        endDate: endDate,
        reason: reason,
      );

      result.fold(
        (failure) => emit(TimeOffRequestErrorState(failure.errorMessage)),
        (success) {
          final start = DateFormat('MM/dd/yyyy').parse(startDate);
          final end = DateFormat('MM/dd/yyyy').parse(endDate);
          final days = end.difference(start).inDays + 1;

          final newRequest = TimeOffRequest(
            id: DateTime.now().millisecondsSinceEpoch,
            typeName: typeName,
            startDate: startDate,
            endDate: endDate,
            duration: '$days days',
            status: 'Pending',
          );
          _localRequests.insert(0, newRequest);

          emit(TimeOffRequestSuccessState());
          loadTimeOffData();
        },
      );
    }
  }
}
