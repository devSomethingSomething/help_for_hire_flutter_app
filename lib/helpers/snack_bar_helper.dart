import 'package:flutter/material.dart';

/// This class allows us to easily display a snack bar to the user
class SnackBarHelper {
  /// Snack Bar Helper constructor
  const SnackBarHelper._();

  /// This method shows a snack bar to the user when invalid
  /// data is entered into a text field
  static void showSnackBar({
    required BuildContext context,
    required String data,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey[800],
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
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
