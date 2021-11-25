class ValidationHelper {
  const ValidationHelper._();

  static String? validateText(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Text cannot be empty';
    } else if (text.length > 32) {
      return 'Text is too long';
    }

    return null;
  }

  static String? validateFee() {
    return null;
  }

  static String? validatePhoneNumber(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Text is empty';
    } else if (text.contains('.') || text.contains(',')) {
      return 'Text cannot contain decimal points';
    }

    return null;
  }

  static String? validateOtp(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'OTP is empty';
    } else if (text.contains('.') || text.contains(',')) {
      return 'OTP cannot contain decimal points';
    } else if (text.length != 6) {
      return 'OTP should be 6 characters long please try again';
    }

    return null;
  }

  static String? validatePassword(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Password cannot be empty';
    } else if (text.length < 8) {
      return 'Password should be at least 8 characters long please try again';
    } else if (text.length > 24) {
      return 'Password cannot be more than 24 characters please try again';
    } else if (!text.contains(RegExp(r'[A-Z]')) ||
        !text.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain uppercase and lowercase';
    } else if (!text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least 1 special character';
    }

    return null;
  }

  static String? validateDescription(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Text is empty';
    }

    return null;
  }

  static String? validateId(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'ID cannot be empty';
    } else if (text.contains('.') || text.contains(',')) {
      return 'ID cannot contain decimal points';
    } else if (text.length != 13) {
      return 'ID should be 13 characters long please try again';
    }

    return null;
  }
}
