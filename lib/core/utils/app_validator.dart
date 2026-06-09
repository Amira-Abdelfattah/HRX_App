class AppValidator {
  AppValidator._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null || val.trim().isEmpty) {
      return 'Email address is required';
    } else if (!emailRegex.hasMatch(val)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validateEmailOrPhone(String? val) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    RegExp phoneRegex = RegExp(r'^[0-9]{11}$');

    if (val == null || val.trim().isEmpty) {
      return 'Email or phone number is required';
    } else if (!emailRegex.hasMatch(val.trim()) &&
        !phoneRegex.hasMatch(val.trim())) {
      return 'Please enter a valid email or 11-digit phone number';
    }
    return null;
  }

  static String? validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    } else if (val.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'Please confirm your password';
    } else if (val != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateFullName(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'Full name is required';
    } else if (val.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? validateCompanyName(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'Company name is required';
    }
    return null;
  }

  static String? validateRole(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'Role is required (e.g. HR Manager)';
    }
    return null;
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'Phone number is required';
    } else if (int.tryParse(val.trim()) == null) {
      return 'Enter numbers only';
    } else if (val.trim().length != 11) {
      return 'Phone number must be 11 digits';
    }
    return null;
  }
}
