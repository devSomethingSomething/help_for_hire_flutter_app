import 'package:flutter/material.dart';

class SnackBarHelper {
  const SnackBarHelper._();

  static void showSnackBar({
    required BuildContext context,
    required String data,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          data,
        ),
      ),
    );
  }
}