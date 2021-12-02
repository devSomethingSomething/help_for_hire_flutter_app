import 'dart:async';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';

class DelayHelper {
  const DelayHelper._();

  static void delayTimer(BuildContext context) {
    Timer(
      const Duration(
        seconds: 5,
      ),
      () => Navigator.popAndPushNamed(
        context,
        RouteManager.signInRegisterPage,
      ),
    );
  }

  static void showLoadingIndicator({
    required BuildContext context,
  }) {
    showDialog(
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      context: context,
    );
  }

  static void hideLoadingIndicator({
    required BuildContext context,
  }) {
    Navigator.pop(context);
  }
}
