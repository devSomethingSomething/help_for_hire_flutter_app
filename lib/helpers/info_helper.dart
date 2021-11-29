import 'package:flutter/material.dart';

class InfoHelper {
  const InfoHelper._();

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
