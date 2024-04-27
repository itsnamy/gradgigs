class Validator {
  static String? validateName(String name) {
    if (name.isEmpty) {
      return 'Please Enter Your Name';
    }

    return null;
  }

  static String? validateEmail(String email) {
    RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );

    if (email.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter your password';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }

  static String? validateComfirmPassword(String comPassword, String password) {
    if (comPassword.isEmpty) {
      return 'Please enter your password';
    } else if (comPassword.length < 6) {
      return 'Enter a password with length at least 6';
    } else if (comPassword != password) {
      return 'Password did not match';
    }

    return null;
  }

  static String? validateDateOfBirth(String? value) {
    if (value == null || value.isEmpty) {
      return 'Date of birth is required';
    }

    // Validate the format of the entered date
    final dateRegExp = RegExp(r'^\d{2}/\d{2}/\d{4}$');
    if (!dateRegExp.hasMatch(value)) {
      return 'Invalid date format. Use dd/mm/yyyy';
    }

    // Split the date into day, month, and year
    final parts = value.split('/');
    final day = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final year = int.tryParse(parts[2]);

    // Validate day, month, and year individually
    if (day == null || month == null || year == null) {
      return 'Invalid date format. Use dd/mm/yyyy';
    }

    if (day < 1 || day > 31) {
      return 'Invalid day';
    }

    if (month < 1 || month > 12) {
      return 'Invalid month';
    }

    if (year < 1900 || year > DateTime.now().year) {
      return 'Invalid year';
    }

    // Additional validation logic can be added if needed

    return null; // Return null if the input is valid
  }
}
