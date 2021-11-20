import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20,left:20,bottom: 20),
      child: Image.asset(
        ImageConstants.logoLight,
      ),
    );
  }
}
