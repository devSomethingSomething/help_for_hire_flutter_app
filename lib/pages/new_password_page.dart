import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/services/firebase_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/white_heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';

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
                              // Add password validation
                              // validator: ,
                            ),
                            const MediumSpacerWidget(),
                            TextFormFieldWidget(
                              controller: _repeatNewPasswordController,
                              icon: Icons.text_fields_rounded,
                              keyboardType: TextInputType.text,
                              labelText: 'Repeat New Password',
                              maxLength: 24,
                              // Add password validation
                              // validator: ,
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
                        if (_key.currentState!.validate()) {
                          if (await ConnectionHelper.hasConnection()) {
                            // Add code here
                            // Will have to first delete the user
                            // Then register them with the new password
                          } else {
                            SnackBarHelper.showSnackBar(
                              context: context,
                              data: 'No internet connection',
                            );
                          }
                        } else {
                          SnackBarHelper.showSnackBar(
                            context: context,
                            data: 'Invalid passwords entered',
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
