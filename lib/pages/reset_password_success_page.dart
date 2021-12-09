/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/white_heading_text_widget.dart';

/// The user will see the success message on this page if their password is reset
/// successfully
class ResetPasswordSuccessPage extends StatelessWidget {
  /// Constructor
  const ResetPasswordSuccessPage();

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlueGradientWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.white,
                  size: 192.0,
                ),
                const MediumSpacerWidget(),
                const Text(
                  'Password reset successfully!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const MediumSpacerWidget(),
                const WhiteHeadingTextWidget(
                  data: 'You may now proceed to sign in',
                ),
                const LargeSpacerWidget(),
                RoundedButtonWidget(
                  data: 'SIGN IN',
                  // Navigate back to the sign in page, clearing the stack as
                  // we go up
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteManager.signInPage,
                    (_) => false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
