import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget();

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
