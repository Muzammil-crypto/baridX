class Validators {

  /// Validate a dropdown field
  static String? validateDropdownField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "Please select an option";
    }
    return null;
  }

  /// Validate if a field is not empty
  static String? validateRequiredField(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your $fieldName";
    }
    return null;
  }

  /// Validate a phone number (Assuming a general format)
  static String? validatePhoneNumber(String? value) {
    final RegExp phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (value == null || value.isEmpty) {
      return "Please enter your phone number";
    } else if (!phoneRegex.hasMatch(value)) {
      return "Your phone number is invalid";
    }
    return null;
  }

  /// Validate email format
  static String? validateEmail(String? value) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value == null || value.isEmpty) {
      return "Email is required";
    } else if (!emailRegex.hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }

  /// Validate weight input (must be a positive number)
  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return "Weight is required";
    }
    final num? weight = num.tryParse(value);
    if (weight == null || weight <= 0) {
      return "Invalid weight. Enter a positive number.";
    }
    return null;
  }

  /// Validate Credit Card (Basic check for 13-19 digit numbers)
  static String? validateCreditCard(String? value) {
    final RegExp cardRegex = RegExp(r'^[0-9]{13,19}$');
    if (value == null || value.isEmpty) {
      return "Card number is required";
    } else if (!cardRegex.hasMatch(value)) {
      return "Invalid card number";
    }
    return null;
  }
}
