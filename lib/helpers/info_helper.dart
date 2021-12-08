/// Imports
import 'package:flutter/material.dart';

/// Holds helper methods related to showing useful information to the user
class InfoHelper {
  /// Constructor
  const InfoHelper._();

  /// This showInfoDialog method will show an alert dialog containing text
  /// about the page and a button to close it
  static void showInfoDialog({
    required BuildContext context,
    required String content,
    required String title,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          actions: [
            TextButton(
              child: const Text(
                'CLOSE',
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
          content: Text(
            content,
          ),
          title: Text(
            title,
          ),
        );
      },
    );
  }
}
