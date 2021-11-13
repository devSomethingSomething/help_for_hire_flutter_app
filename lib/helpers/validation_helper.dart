class ValidationHelper {
  static const _idLength = 13;

  const ValidationHelper._();

  static String validateId({
    required String id,
  }) {
    id = id.toLowerCase();

    if (id.length == _idLength) {
      if (!id.contains(RegExp(r'[a-z]_.'))) {
        // Continue here later

        return 'Valid ID number';
      } else {
        return 'ID numbers cannot contain letters or decimal points';
      }
    } else {
      return 'Incorrect ID length';
    }
  }
}
