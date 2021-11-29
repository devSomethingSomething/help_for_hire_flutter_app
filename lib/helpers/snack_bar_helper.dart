import 'package:flutter/material.dart';

class SnackBarHelper {
  const SnackBarHelper._();

  static void showSnackBar({
    required BuildContext context,
    required String data,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.warning,
              color: Colors.white,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              data,
            ),
          ],
        ),
      ),
    );
  }
}
