import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:provider/provider.dart';

class RegistrationSuccessPage extends StatelessWidget {
  const RegistrationSuccessPage();

  @override
  Widget build(BuildContext context) {
    context.read<UserService>().registerUser(
          context: context,
        );
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SingleChildScrollView(
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
                'Registration Completed Successfully!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const MediumSpacerWidget(),
              const Text(
                'You have successfully registered\nand may now proceed to sign in',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              const MediumSpacerWidget(),
              const MediumSpacerWidget(),
              RoundedButtonWidget(
                data: 'SIGN IN',
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  RouteManager.signInPage,
                  (_) => false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
