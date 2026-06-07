import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  static const String _langKey = 'selected_language';
  static const String _emailNotifKey = 'email_notifications';
  static const String _pushNotifKey = 'push_notifications';
  static const String _perfAlertsKey = 'perf_alerts';
  static const String _leaveReqKey = 'leave_requests';
  static const String _newHiresKey = 'new_hires';

  ThemeMode _themeMode = ThemeMode.system;
  String _language = 'English (US)';

  bool _emailNotifications = true;
  bool _pushNotifications = true;
  bool _performanceAlerts = true;
  bool _leaveRequests = true;
  bool _newHires = false;

  ThemeProvider() {
    _loadFromPrefs();
  }

  ThemeMode get themeMode => _themeMode;
  String get language => _language;
  bool get emailNotifications => _emailNotifications;
  bool get pushNotifications => _pushNotifications;
  bool get performanceAlerts => _performanceAlerts;
  bool get leaveRequests => _leaveRequests;
  bool get newHires => _newHires;

  bool get isDarkMode {
    if (_themeMode == ThemeMode.system) {
      return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    _themeMode =
        ThemeMode.values[prefs.getInt(_themeKey) ?? ThemeMode.system.index];
    _language = prefs.getString(_langKey) ?? 'English (US)';
    _emailNotifications = prefs.getBool(_emailNotifKey) ?? true;
    _pushNotifications = prefs.getBool(_pushNotifKey) ?? true;
    _performanceAlerts = prefs.getBool(_perfAlertsKey) ?? true;
    _leaveRequests = prefs.getBool(_leaveReqKey) ?? true;
    _newHires = prefs.getBool(_newHiresKey) ?? false;

    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, mode.index);
    notifyListeners();
  }

  Future<void> toggleTheme(bool isOn) async {
    await setThemeMode(isOn ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> setLanguage(String lang) async {
    _language = lang;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_langKey, lang);
    notifyListeners();
  }

  Future<void> updateNotificationSetting(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    switch (key) {
      case _emailNotifKey:
        _emailNotifications = value;
        break;
      case _pushNotifKey:
        _pushNotifications = value;
        break;
      case _perfAlertsKey:
        _performanceAlerts = value;
        break;
      case _leaveReqKey:
        _leaveRequests = value;
        break;
      case _newHiresKey:
        _newHires = value;
        break;
    }
    await prefs.setBool(key, value);
    notifyListeners();
  }

  static String get emailKey => _emailNotifKey;
  static String get pushKey => _pushNotifKey;
  static String get perfKey => _perfAlertsKey;
  static String get leaveKey => _leaveReqKey;
  static String get hiresKey => _newHiresKey;
}
