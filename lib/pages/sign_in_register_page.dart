import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/logos/logo_widget.dart';

class SignInRegisterPage extends StatelessWidget {
  const SignInRegisterPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/deco_up.png'),
              height: 100,
              width: 500,
            ),
            const LogoWidget(),
            ButtonWidget(
              data: 'SIGN IN',
              onPressed: () {
                Navigator.pushNamed(context, RouteManager.signInPage);
              },
            ),
            const SizedBox(
              height: 15,
            ),
            ButtonWidget(
              data: 'REGISTER',
              onPressed: () {
                Navigator.pushNamed(context, RouteManager.registerPage);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const Image(
              image: AssetImage('assets/images/deco_down.png'),
              height: 100,
              width: 500,
            ),
          ],
        ),
      ),
    );
  }
}
