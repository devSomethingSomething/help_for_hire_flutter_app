import 'dart:io';

import 'package:flutter/material.dart';

class ConnectionHelper {
  const ConnectionHelper._();

  static void checkConnection(BuildContext context) async {
    try {
      await InternetAddress.lookup(
        'google.com',
      );
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No connection',
          ),
        ),
      );
    }
  }
}
