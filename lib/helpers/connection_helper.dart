/// Imports
import 'dart:io';

/// Holds helper methods related to internet connections
class ConnectionHelper {
  /// Constructor
  const ConnectionHelper._();

  /// This method is used to check if there is a connection to the internet
  ///
  /// Will return true if there is a connection or false with a SocketException
  /// if there is no connection
  static Future<bool> hasConnection() async {
    try {
      await InternetAddress.lookup(
        'example.com',
      );

      // Indicates a connection
      return true;
    } on SocketException catch (_) {
      // Indicates no connection
      return false;
    }
  }
}
