/// Extension on the String data type
extension StringExtension on String {
  /// Allows us to capitalize the first character in a String
  ///
  /// Will return the new String
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}
