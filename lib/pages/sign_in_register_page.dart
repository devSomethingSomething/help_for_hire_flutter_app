import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/logos/logo_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';

class SignInRegisterPage extends StatelessWidget {
  const SignInRegisterPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),
            ButtonWidget(
              data: 'SIGN IN',
              onPressed: () {
                // Navigator.pushNamed(context, RouteManager.signInPage);
              },
            ),
            const SmallSpacerWidget(),
            ButtonWidget(
              data: 'REGISTER',
              onPressed: () {
                // Navigator.pushNamed(context, RouteManager.registerPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
