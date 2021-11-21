import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/firebase_service.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/text_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/icons/icon_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/password_text_field_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/text_field_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage();

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _key = GlobalKey<FormState>();

  // This page requires validation logic for the text fields
  // ID validation
  // Password validation
  // Put these methods in the validation helper class
  final _idNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _idNumberController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.blue.shade900,
                    Colors.blue.shade600,
                  ],
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: Center(
                child: Column(
                  children: [
                    const LargeSpacerWidget(),
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const MediumSpacerWidget(),
                    Padding(
                      padding: const EdgeInsets.all(
                        16.0,
                      ),
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              controller: _idNumberController,
                              labelText: 'ID Number',
                              icon: Icons.person,
                              keyboardType: TextInputType.number,
                              maxLength: 13,
                            ),
                            const MediumSpacerWidget(),
                            TextFormFieldWidget(
                              controller: _passwordController,
                              labelText: 'Password',
                              icon: Icons.password,
                              keyboardType: TextInputType.text,
                              maxLength: 24,
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const LargeSpacerWidget(),
                    RoundedButtonWidget(
                      data: 'SUBMIT',
                      horizontal: 64.0,
                      onPressed: () async {
                        final hasConnection =
                            await ConnectionHelper.hasConnection();

                        // Requires check for correct login so that the app knows
                        // to move on to the next page
                        // Will require changing the firebase services sign in
                        // method
                        if (hasConnection) {
                          FirebaseService.signInUser(
                            context: context,
                            id: _idNumberController.text,
                            password: _passwordController.text,
                          );
                        }
                      },
                    ),
                    const SmallSpacerWidget(),
                    TextButton(
                      child: const Padding(
                        padding: EdgeInsets.all(
                          16.0,
                        ),
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onPressed: () => Navigator.popAndPushNamed(
                        context,
                        RouteManager.resetPasswordPage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextButton(
              child: const Padding(
                padding: EdgeInsets.all(
                  16.0,
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: () => Navigator.popAndPushNamed(
                context,
                RouteManager.registerPage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
