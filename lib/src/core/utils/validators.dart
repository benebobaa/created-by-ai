// lib/src/core/utils/validators.dart

class AppValidators {
  /// Validates if the [value] is not empty.
  static String? notEmpty(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName cannot be empty.';
    }
    return null;
  }

  /// Validates if the [value] is a valid email format.
  static String? isValidEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email cannot be empty.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value.trim())) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  /// Validates if the [value] meets a minimum length.
  static String? minLength(String? value, int minLength, {String fieldName = 'Field'}) {
    if (value == null || value.trim().length < minLength) {
      return '$fieldName must be at least $minLength characters long.';
    }
    return null;
  }

  /// Validates if [value1] matches [value2]. Useful for password confirmation.
  static String?  match(String? value1, String? value2, {String fieldName1 = 'Field', String fieldName2 = 'Confirm Field'}) {
    if (value1 != value2) {
      return '$fieldName2 does not match $fieldName1.';
    }
    return null;
  }
}
