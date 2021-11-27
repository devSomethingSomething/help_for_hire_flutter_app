import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/pages/worker_profile_page.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/firebase_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';

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

  /// Handles logic for when the submit button is pressed
  /// Includes things like checking the internet connection or making sure that
  /// text fields have valid values
  void _onPressed() async {
    if (_key.currentState!.validate()) {
      if (await ConnectionHelper.hasConnection()) {
        // This should work now, perhaps there is a better
        // way of doing it but this approach seems to work
        final signedIn = await FirebaseService.signInUser(
          context: context,
          id: _idNumberController.text,
          password: _passwordController.text,
        );

        if (signedIn) {
          // Set a reference to the user with a specific ID
          // Allows us to get their details
          context.read<UserService>().currentUser.userId =
              _idNumberController.text;

          // Load the user
          await context.read<UserService>().loadUser(
                context: context,
              );

          // Go to first page
          Navigator.pushNamedAndRemoveUntil(
            context,
            // Change this back to invites later
            context.read<UserService>().isEmployer
                ? RouteManager.employerProfilePage
                : RouteManager.workerProfilePage,
            (_) => false,
          );
        }
      } else {
        SnackBarHelper.showSnackBar(
          context: context,
          data: 'No internet connection',
        );
      }
    } else {
      SnackBarHelper.showSnackBar(
        context: context,
        data: 'Some fields are invalid',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlueGradientWidget(),
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
                    const SmallSpacerWidget(),
                    const Text(
                      'Please sign in to continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
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
                              validator: ValidationHelper.validateId,
                            ),
                            const MediumSpacerWidget(),
                            TextFormFieldWidget(
                              controller: _passwordController,
                              labelText: 'Password',
                              icon: Icons.password,
                              keyboardType: TextInputType.text,
                              maxLength: 24,
                              obscureText: true,
                              validator: ValidationHelper.validatePassword,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const LargeSpacerWidget(),
                    RoundedButtonWidget(
                      data: 'SUBMIT',
                      horizontal: 64.0,
                      onPressed: _onPressed,
                    ),
                    const SmallSpacerWidget(),
                    TextButton(
                      child: const Padding(
                        padding: EdgeInsets.all(
                          8.0,
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
      resizeToAvoidBottomInset: false,
    );
  }
}
