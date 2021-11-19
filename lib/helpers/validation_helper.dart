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
}
