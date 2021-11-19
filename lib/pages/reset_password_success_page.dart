import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';

class ResetPasswordSuccessPage extends StatelessWidget {
  const ResetPasswordSuccessPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              size: 192.0,
              color: Colors.white,
            ),
            const MediumSpacerWidget(),
            const Text(
              'Password Reset Successfully!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(
                32.0,
              ),
              child: Text(
                'You have successfully reset your password and may now proceed to sign in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const MediumSpacerWidget(),
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.only(
                  bottom: 16.0,
                  left: 32.0,
                  right: 32.0,
                  top: 16.0,
                ),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context,
                RouteManager.signInPage,
                (_) => false,
              ),
              style: ElevatedButton.styleFrom(
                elevation: 8.0,
                onPrimary: Colors.blue[900],
                primary: Colors.white,
                shape: const StadiumBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
