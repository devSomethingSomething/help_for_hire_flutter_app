import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/firebase_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/white_heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage();

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final _key = GlobalKey<FormState>();

  final _newPasswordController = TextEditingController();
  final _repeatNewPasswordController = TextEditingController();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _repeatNewPasswordController.dispose();

    super.dispose();
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
                    const HeaderWidget(
                      data: 'New Password',
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
                      data: 'Enter your new password',
                    ),
                    const LargeSpacerWidget(),
                    Padding(
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              controller: _newPasswordController,
                              icon: Icons.password_rounded,
                              keyboardType: TextInputType.text,
                              labelText: 'New Password',
                              maxLength: 24,
                              obscureText: true,
                              // Add password validation
                              // validator: ,
                              validator: ValidationHelper.validatePassword,
                            ),
                            const MediumSpacerWidget(),
                            TextFormFieldWidget(
                              controller: _repeatNewPasswordController,
                              icon: Icons.text_fields_rounded,
                              keyboardType: TextInputType.text,
                              labelText: 'Repeat New Password',
                              maxLength: 24,
                              obscureText: true,
                              // Add password validation
                              // validator: ,
                              validator: ValidationHelper.validatePassword,
                            ),
                          ],
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
                        if (_key.currentState!.validate() &&
                            _newPasswordController.text ==
                                _repeatNewPasswordController.text) {
                          if (await ConnectionHelper.hasConnection()) {
                            showDialog(
                              builder: (_) => const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                              context: context,
                            );

                            // --- Note that this instead could use a custom
                            // update method in the web api which uses the
                            // firebase admin sdk. Should look into this instead
                            // as it will be a better solution to our problem
                            // Will have to first delete the user
                            await FirebaseService.deleteUser(
                              id: context
                                  .read<UserService>()
                                  .currentUser
                                  .userId,
                            );

                            // Then register them with the new password
                            await FirebaseService.createUser(
                              context: context,
                              id: context
                                  .read<UserService>()
                                  .currentUser
                                  .userId,
                              password: _newPasswordController.text,
                            );

                            // Pop the indicator
                            Navigator.pop(context);

                            // Go to next page
                            Navigator.pushNamed(
                              context,
                              RouteManager.resetPasswordSuccessPage,
                            );
                          } else {
                            SnackBarHelper.showSnackBar(
                              context: context,
                              data: 'No internet connection',
                            );
                          }
                        } else {
                          SnackBarHelper.showSnackBar(
                            context: context,
                            data:
                                'Invalid passwords entered or the passwords do not match',
                          );
                        }
                      },
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
