import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/custom_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/logo_widget.dart';

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
            CustomButtonWidget(
              data: 'SIGN IN',
              onPressed: () {
                 Navigator.pushNamed(context, RouteManager.loginPage);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButtonWidget(
              data: 'REGISTER',
              onPressed: () {
                Navigator.pushNamed(context, RouteManager.newUserRegisterPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
