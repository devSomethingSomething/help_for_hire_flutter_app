/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/logos/logo_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';

/// This page allows the user to go to either the sign in page or the register
/// page
class SignInRegisterPage extends StatelessWidget {
  /// Constructor
  const SignInRegisterPage();

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageConstants.decoUp,
              height: 100.0,
              width: 500.0,
            ),
            const LogoWidget(),
            RoundedButtonWidget(
              data: 'SIGN IN',
              invertColors: true,
              // Goes to the sign in page
              onPressed: () => Navigator.pushNamed(
                context,
                RouteManager.signInPage,
              ),
            ),
            const SmallSpacerWidget(),
            RoundedButtonWidget(
              data: 'REGISTER',
              invertColors: true,
              // Goes to the register page
              onPressed: () => Navigator.pushNamed(
                context,
                RouteManager.registerPage,
              ),
            ),
            const SmallSpacerWidget(),
            Image.asset(
              ImageConstants.decoDown,
              height: 100.0,
              width: 500.0,
            ),
          ],
        ),
      ),
    );
  }
}
