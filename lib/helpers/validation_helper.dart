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
    String? text,
  ) {
    if (text == null || text.isEmpty) {
      return 'Text is empty';
    } else if (text.contains('.') || text.contains(',')) {
      return 'Text cannot contain decimal points';
    }
    return null;
  }
}
