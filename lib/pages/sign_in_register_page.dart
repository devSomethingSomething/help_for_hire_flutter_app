import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/logos/logo_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';

class SignInRegisterPage extends StatelessWidget {
  const SignInRegisterPage();

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
              onPressed: () => Navigator.pushNamed(
                context,
                RouteManager.signInPage,
              ),
            ),
            const SmallSpacerWidget(),
            RoundedButtonWidget(
              data: 'REGISTER',
              invertColors: true,
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
