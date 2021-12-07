import 'dart:async';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';

/// Delay Helper class which is used to show the loading indicator or hide it
class DelayHelper {
  /// Delay Helper constructor
  const DelayHelper._();

  /// This delayTimer method will be used by the splash page and will
  /// show it for 5 seconds and navigate to the next page
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

  /// This showLoadingIndicator method will display the
  /// Circular Progress Indicator while the data is being
  /// loaded in the background
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

  /// This hideLoadingIndicator method will hide the
  /// Circular Progress Indicator ones the data has been loaded in
  static void hideLoadingIndicator({
    required BuildContext context,
  }) {
    Navigator.pop(context);
  }
}
