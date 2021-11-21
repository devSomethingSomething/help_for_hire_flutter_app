import 'dart:io';

class ConnectionHelper {
  const ConnectionHelper._();

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
