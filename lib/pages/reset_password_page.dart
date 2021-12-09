/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/firebase_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/white_text_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/white_heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';

/// This page handles the reset password system, asking the user to enter their
/// ID number which gets checked against the online database to determine if
/// the user exists
class ResetPasswordPage extends StatefulWidget {
  /// Constructor
  const ResetPasswordPage();

  /// Create the state for this widget
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

/// The state class for the reset password page
class _ResetPasswordPageState extends State<ResetPasswordPage> {
  /// Key used for form validation
  final _key = GlobalKey<FormState>();

  /// Text controllers
  final _idNumberController = TextEditingController();

  /// Cleans up any unneeded objects or resources
  @override
  void dispose() {
    _idNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    const HeaderWidget(
                      data: 'Reset Password',
                    ),
                    const SmallSpacerWidget(),
                    const DividerWidget(
                      height: 4.0,
                      width: 256.0,
                    ),
                    const Icon(
                      Icons.password_rounded,
                      color: Colors.white,
                      size: 128.0,
                    ),
                    const WhiteHeadingTextWidget(
                      data: 'Forgot your password?\nReset it here',
                    ),
                    const LargeSpacerWidget(),
                    Padding(
                      child: Form(
                        key: _key,
                        child: TextFormFieldWidget(
                          controller: _idNumberController,
                          icon: Icons.person,
                          keyboardType: TextInputType.number,
                          labelText: 'ID Number',
                          maxLength: 13,
                          validator: ValidationHelper.validateId,
                        ),
                      ),
                      padding: const EdgeInsets.all(
                        16.0,
                      ),
                    ),
                    const LargeSpacerWidget(),
                    RoundedButtonWidget(
                      data: 'SUBMIT',
                      onPressed: () async {
                        // Validate form first
                        if (_key.currentState!.validate()) {
                          // Check the connection
                          if (await ConnectionHelper.hasConnection()) {
                            // Check if the user exists
                            if (await FirebaseService.isExistingId(
                              id: _idNumberController.text,
                            )) {
                              context.read<UserService>().currentUser.userId =
                                  _idNumberController.text;

                              // Load the user
                              await context.read<UserService>().loadUser(
                                    context: context,
                                  );

                              // await FirebaseService.handleOtp(
                              //   context: context,
                              //   phoneNumber: context
                              //       .read<UserService>()
                              //       .currentUser
                              //       .phoneNumber,
                              // );

                              // Go to the next page in the reset password process
                              Navigator.pushNamed(
                                context,
                                RouteManager.newPasswordPage,
                              );
                            } else {
                              SnackBarHelper.showSnackBar(
                                context: context,
                                data:
                                    'User with ID: ${_idNumberController.text}, does not exist',
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
                            data: 'Invalid ID number entered',
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                WhiteTextButtonWidget(
                  data: 'Register',
                  // Go back to the register page
                  onPressed: () => Navigator.popAndPushNamed(
                    context,
                    RouteManager.registerPage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
