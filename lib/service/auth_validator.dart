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

  static String? validateUTMEmail(String email) {
    RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@(?:utm\.my|graduate\.utm\.my)$',
    );

    if (email.isEmpty) {
      return 'Please enter your email';
    } else if (!emailRegex.hasMatch(email)) {
      return 'Please enter a UTM email';
    }
    return null;
  }

  static String? validateFaculty(String faculty) {
    if (faculty.isEmpty) {
      return "Please enter your faculty";
    }
    return null;
  }

  static String? validateClubAndOrg(String clubOrg) {
    if (clubOrg.isEmpty) {
      return "Please enter your club/organisation";
    }
    return null;
  }

  static String? validatePhoneNumber(String phoneNumber) {
    RegExp phoneRegex = RegExp(
      r'^[0-9+]{1,}[0-9\-]{3,15}$',
    );

    if (phoneNumber.isEmpty) {
      return 'Please enter your phone number';
    } else if (!phoneRegex.hasMatch(phoneNumber)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validateCollege(String college) {
    if (college.isEmpty) {
      return "Please enter your faculty";
    }
    return null;
  }

  static String? validateYearProgramme(String input) {
    RegExp regex = RegExp(
      r'^[1-5]/[A-Za-z]{4,5}$',
    );

    if (input.isEmpty) {
      return 'Please enter your year/programme';
    } else if (!regex.hasMatch(input)) {
      return 'Please enter a valid year/programme format (e.g., 3/SECJH)';
    }
    return null;
  }

  static String? validatebankName(String bankName) {
    if (bankName.isEmpty) {
      return "Please enter your bank name";
    }
    return null;
  }

  static String? validatebankHolderName(String bankHolderName) {
    if (bankHolderName.isEmpty) {
      return "Please enter your bank holder name";
    }
    return null;
  }

  static String? validatebankAccountNumber(String bankNumber) {
    if (bankNumber.isEmpty) {
      return "Please enter your bank number";
    }
    return null;
  }
}
