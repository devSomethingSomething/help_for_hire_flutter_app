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

  static String? validateFee(
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

  static String? validateDescription(
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Text is empty';
    }

    return null;
  }
}
