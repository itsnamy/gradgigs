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
}
