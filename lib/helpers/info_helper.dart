import 'package:flutter/material.dart';

/// Info Helper class will be used by the Employer and Worker pages to
/// give a small description about what the pages show
class InfoHelper {
  /// info helper constructor
  const InfoHelper._();

  /// This showInfoDialog method will show a alert dialog containing text
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
