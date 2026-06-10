import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 0;
  Map<String, dynamic>? _selectedEmployee;

  int get currentIndex => _currentIndex;

  Map<String, dynamic>? get selectedEmployee => _selectedEmployee;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void selectEmployeeAndNavigate(
    Map<String, dynamic> employee,
    int targetIndex,
  ) {
    _selectedEmployee = employee;
    _currentIndex = targetIndex;
    notifyListeners();
  }
}
