/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
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

/// Handles the sign in process for a user
class SignInPage extends StatefulWidget {
  /// Constructor
  const SignInPage();

  /// Creates the state for this page
  @override
  State<SignInPage> createState() => _SignInPageState();
}

/// The state class used for sign in
class _SignInPageState extends State<SignInPage> {
  /// Key used for form validation
  final _key = GlobalKey<FormState>();

  /// Controllers
  final _idNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  /// Cleans up unused objects or resources
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
            // Change this later if needed
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

  /// Builds the widget
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
                      // Go to the reset password page
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
              // Go to the register page
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
