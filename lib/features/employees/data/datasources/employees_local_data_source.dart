import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/cache/shared_prefrence_utils.dart';
import '../models/add_employee_response_model.dart';

abstract class EmployeesLocalDataSource {
  Future<void> cacheEmployee(AddEmployeeResponseModel employee);

  Future<void> cacheAllEmployees(List<AddEmployeeResponseModel> employees);

  Future<List<AddEmployeeResponseModel>> getCachedEmployees();

  Future<void> clearCache();
}

@Injectable(as: EmployeesLocalDataSource)
class EmployeesLocalDataSourceImpl implements EmployeesLocalDataSource {
  static const String _kEmployeesKey = 'cached_employees';

  @override
  Future<void> cacheEmployee(AddEmployeeResponseModel employee) async {
    List<AddEmployeeResponseModel> cached = await getCachedEmployees();

    // Avoid duplicates by email or userId
    bool exists = cached.any(
      (e) =>
          (e.email != null && e.email == employee.email) ||
          (e.userId != null && e.userId == employee.userId && e.userId != 0),
    );

    if (!exists) {
      cached.add(employee);
      await _saveList(cached);
    }
  }

  @override
  Future<void> cacheAllEmployees(
    List<AddEmployeeResponseModel> employees,
  ) async {
    List<AddEmployeeResponseModel> cached = await getCachedEmployees();

    for (var employee in employees) {
      bool exists = cached.any(
        (e) =>
            (e.email != null && e.email == employee.email) ||
            (e.userId != null && e.userId == employee.userId && e.userId != 0),
      );
      if (!exists) {
        cached.add(employee);
      }
    }
    await _saveList(cached);
  }

  Future<void> _saveList(List<AddEmployeeResponseModel> list) async {
    List<Map<String, dynamic>> jsonList = list.map((e) => e.toJson()).toList();
    await SharedPreferenceUtils.saveData(
      key: _kEmployeesKey,
      value: jsonEncode(jsonList),
    );
  }

  @override
  Future<List<AddEmployeeResponseModel>> getCachedEmployees() async {
    String? jsonString =
        SharedPreferenceUtils.getData(key: _kEmployeesKey) as String?;
    if (jsonString == null || jsonString.isEmpty) return [];

    try {
      List<dynamic> decodedList = jsonDecode(jsonString);
      return decodedList.map((item) {
        return AddEmployeeResponseModel.fromJson(item as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print("Error decoding cached employees: $e");
      return [];
    }
  }

  @override
  Future<void> clearCache() async {
    await SharedPreferenceUtils.removeData(key: _kEmployeesKey);
  }
}
