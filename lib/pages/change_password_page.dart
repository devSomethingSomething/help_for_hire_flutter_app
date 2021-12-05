import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/info_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/services/firebase_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage();

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _key = GlobalKey<FormState>();

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _repeatNewPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _repeatNewPasswordController.dispose();

    super.dispose();
  }

  void _onPressed() async {
    // Make sure form is valid
    ValidationHelper.validateForm(
      context: context,
      key: _key,
      // Make sure that there is a connection
      function: () => ValidationHelper.checkConnection(
        context: context,
        function: () async {
          // Check if passwords match
          if (_newPasswordController.text ==
              _repeatNewPasswordController.text) {
            DelayHelper.showLoadingIndicator(context: context);

            // Check if old password is correct
            if (await FirebaseService.signInUser(
              context: context,
              id: context.read<UserService>().currentUser.userId,
              password: _oldPasswordController.text,
            )) {
              // Update user password
              await FirebaseService.deleteUser(
                id: context.read<UserService>().currentUser.userId,
              );

              await FirebaseService.createUser(
                context: context,
                id: context.read<UserService>().currentUser.userId,
                password: _newPasswordController.text,
              );

              DelayHelper.hideLoadingIndicator(context: context);

              Navigator.pop(context);
            }

            DelayHelper.hideLoadingIndicator(context: context);
          } // If they do not, show an error
          else {
            SnackBarHelper.showSnackBar(
              context: context,
              data: 'New passwords do not match',
            );
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info_outline_rounded,
            ),
            onPressed: () => InfoHelper.showInfoDialog(
              context: context,
              content: 'This page allows you to change your password',
              title: 'Change Password Details',
            ),
          ),
        ],
        backgroundColor: ColorConstants.darkBlue,
        foregroundColor: Colors.white,
        title: const Text(
          'Change Password',
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Form(
                child: Column(
                  children: [
                    const Icon(
                      Icons.password_rounded,
                      color: Colors.black,
                      size: 128.0,
                    ),
                    const SmallSpacerWidget(),
                    const Text(
                      'Change Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const LargeSpacerWidget(),
                    Card(
                      child: Padding(
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              controller: _oldPasswordController,
                              labelText: 'Old Password',
                              keyboardType: TextInputType.text,
                              icon: Icons.history,
                              lightMode: true,
                              obscureText: true,
                              validator: ValidationHelper.validatePassword,
                            ),
                            const MediumSpacerWidget(),
                            TextFormFieldWidget(
                              controller: _newPasswordController,
                              labelText: 'New Password',
                              keyboardType: TextInputType.text,
                              icon: Icons.fiber_new_rounded,
                              lightMode: true,
                              obscureText: true,
                              validator: ValidationHelper.validatePassword,
                            ),
                            const MediumSpacerWidget(),
                            TextFormFieldWidget(
                              controller: _repeatNewPasswordController,
                              labelText: 'Repeat New Password',
                              keyboardType: TextInputType.text,
                              icon: Icons.password_rounded,
                              lightMode: true,
                              obscureText: true,
                              validator: ValidationHelper.validatePassword,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 16.0,
                        ),
                      ),
                      color: Colors.white,
                      elevation: 2,
                      shadowColor: Colors.black,
                    ),
                    const LargeSpacerWidget(),
                    RoundedButtonWidget(
                      data: 'SUBMIT',
                      onPressed: _onPressed,
                      invertColors: true,
                    ),
                  ],
                ),
                key: _key,
              ),
            ),
            padding: const EdgeInsets.all(
              16.0,
            ),
          ),
        ],
      ),
    );
  }
}
