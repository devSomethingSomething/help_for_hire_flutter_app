import 'dart:io';

import 'package:flutter/material.dart';

class ConnectionHelper {
  const ConnectionHelper._();

  static Future<bool> checkConnection(BuildContext context) async {
    try {
      await InternetAddress.lookup(
        'google.com',
      );

      // Indicates that a connection exists
      return true;
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No connection',
          ),
        ),
      );

      // Indicates no connection
      return false;
    }
  }
}
