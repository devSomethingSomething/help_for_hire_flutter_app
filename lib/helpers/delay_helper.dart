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
      // This needs to change once the homePage gets added
      // Should change 'homePage' to RouteManager.homePage
      // Currently will throw an exception if a route is not found
      () => Navigator.of(context).popAndPushNamed(RouteManager.otpPage),
    );
  }
}
