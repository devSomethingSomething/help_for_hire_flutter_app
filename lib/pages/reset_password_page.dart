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

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage();

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _key = GlobalKey<FormState>();

  final _idNumberController = TextEditingController();

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
                          // Need to check the ID number validation method
                          // Just to make sure that it works perfectly for
                          // IDs while still allowing for foreign IDs
                          // validator: ,
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
                        if (_key.currentState!.validate()) {
                          if (await ConnectionHelper.hasConnection()) {
                            if (await FirebaseService.isExistingId(
                              id: _idNumberController.text,
                            )) {
                              context.read<UserService>().currentUser.userId =
                                  _idNumberController.text;

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
                              
                              Navigator.pushNamed(context, RouteManager.newPasswordPage);
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
