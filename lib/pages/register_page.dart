/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/firebase_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';

/// This page allows a new user to register for the application
class RegisterPage extends StatefulWidget {
  /// Constructor
  const RegisterPage();

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /// The _key variable is used to validate form fields
  final _key = GlobalKey<FormState>();

  /// Variables for the Text editing controllers
  final _idNumberController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  /// Method dispose is used to clear any controllers when the page is built
  @override
  void dispose() {
    _idNumberController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlueGradientWidget(),
          SafeArea(
            /// Single child scroll view is used to prevent overflow and makes
            /// the page scrollable
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: Center(
                child: Column(
                  children: [
                    const HeaderWidget(
                      data: 'Register',
                    ),
                    const SmallSpacerWidget(),
                    const DividerWidget(
                      height: 4.0,
                      width: 256.0,
                    ),
                    const SmallSpacerWidget(),
                    const Text(
                      'Create an account with\nHelp For Hire!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(
                        16.0,
                      ),
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            /// Text form field with validation
                            TextFormFieldWidget(
                              controller: _idNumberController,
                              labelText: 'ID Number',
                              icon: Icons.person,
                              keyboardType: TextInputType.number,
                              maxLength: 13,
                              validator: ValidationHelper.validateId,
                            ),
                            const SmallSpacerWidget(),

                            /// Text form field with validation
                            TextFormFieldWidget(
                              controller: _nameController,
                              labelText: 'Name',
                              icon: Icons.text_format,
                              keyboardType: TextInputType.text,
                              validator: ValidationHelper.validateText,
                            ),
                            const SmallSpacerWidget(),

                            /// Text form field with validation
                            TextFormFieldWidget(
                              controller: _surnameController,
                              labelText: 'Surname',
                              icon: Icons.text_fields,
                              keyboardType: TextInputType.text,
                              validator: ValidationHelper.validateText,
                            ),
                            const SmallSpacerWidget(),

                            /// Text form field with validation
                            TextFormFieldWidget(
                              controller: _phoneNumberController,
                              labelText: 'Phone Number',
                              icon: Icons.phone,
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              validator: ValidationHelper.validatePhoneNumber,
                            ),
                            const SmallSpacerWidget(),

                            /// Text form field with validation
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
                    const SmallSpacerWidget(),
                    RoundedButtonWidget(
                      data: 'SUBMIT',
                      onPressed: () async {
                        // This needs to be cleaned up later on
                        /// Check is all fields are valid, has a connection to
                        /// the database and is not a existing user
                        if (_key.currentState!.validate()) {
                          if (await ConnectionHelper.hasConnection()) {
                            if (await FirebaseService.isNotExistingUser(
                              context: context,
                              id: _idNumberController.text,
                              password: _passwordController.text,
                            )) {
                              context.read<UserService>().currentUser =
                                  UserModel(
                                userId: _idNumberController.text,
                                name: _nameController.text,
                                surname: _surnameController.text,
                                phoneNumber: _phoneNumberController.text,
                                locationId: '',
                              );

                              /// Navigates to the Loaction Page
                              Navigator.pushNamed(
                                context,
                                RouteManager.locationPage,
                              );
                            } else {
                              SnackBarHelper.showSnackBar(
                                context: context,
                                data:
                                    'Duplicate user details, ID has to be unique',
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
                      },
                    ),
                    const SmallSpacerWidget(),
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),

                    /// If the user already has an account they can sign in
                    /// with the text button
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      /// Navigates to the Sign in Page
                      onPressed: () => Navigator.popAndPushNamed(
                        context,
                        RouteManager.signInPage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
