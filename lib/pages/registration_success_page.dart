import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';

class RegistrationSuccessPage extends StatefulWidget {
  const RegistrationSuccessPage();

  @override
  _RegistrationSuccessPageState createState() =>
      _RegistrationSuccessPageState();
}

class _RegistrationSuccessPageState extends State<RegistrationSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        data: 'Registration successful',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Image(
                height: 150,
                width: 150,
                image: AssetImage(
                  'assets/images/Green_Check.png',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'You have successfully registered for Help for Hire!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Sign in below in order to start using the application',
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                child: const Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RouteManager.signInPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
