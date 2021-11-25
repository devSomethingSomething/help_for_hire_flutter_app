import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/icons/icon_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/details_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/password_text_field_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';

class NewPasswordPage extends StatelessWidget {
  final _newPasswordController = TextEditingController();
  final _repeatNewPasswordController = TextEditingController();

  NewPasswordPage();

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmNewPasswordController =
        TextEditingController();
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
                child: Form(
                  key: _key,
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
                      const SmallSpacerWidget(),
                      const IconWidget(
                        icon: Icons.password_rounded,
                      ),
                      const HeadingTextWidget(
                        data: 'Enter your New Password',
                      ),
                      const SmallSpacerWidget(),
                      const DetailsTextWidget(
                        data:
                            'Enter your new password below to\ncomplete the password reset process',
                      ),
                      const MediumSpacerWidget(),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: 'Enter new password'),
                        keyboardType: TextInputType.text,
                        controller: newPasswordController,
                        validator: ValidationHelper.validatePassword,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: 'Repeat new password'),
                        keyboardType: TextInputType.text,
                        controller: confirmNewPasswordController,
                        validator: ValidationHelper.validatePassword,
                      ),
                      const LargeSpacerWidget(),
                      RoundedButtonWidget(
                        data: 'SUBMIT',
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            Navigator.pushNamed(
                              context,
                              RouteManager.resetPasswordSuccessPage,
                            );
                          } else {}
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
