class ValidationHelper {
  const ValidationHelper._();

  static String? validateText(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Text is empty';
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
  }

  static String? validatePassword(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Password is empty';
    } else if (text.length < 8) {
      return 'Password should be at least 8 characters long please try again';
    } else if (text.length > 11) {
      return 'Password cant be more than 11 characters please try again';
    } else if (text.contains(RegExp(r'[A-Z]')) &&
        text.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain uppercase and lowercase';
    } else if (text.contains(RegExp(r'[A-Z]')) &&
        text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least 1 special character';
    }
  }

  static String? validateDescription(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Text is empty';
    }

    return null;
  }
}
