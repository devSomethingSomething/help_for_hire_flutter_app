/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';

/// Custom Logo widget for the Splash page and Home page
class LogoWidget extends StatelessWidget {
  /// Constructor
  const LogoWidget();

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: Image.asset(
        ImageConstants.logoLight,
      ),
    );
  }
}
