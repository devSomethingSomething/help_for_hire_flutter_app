import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/text_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/icons/icon_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/details_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/text_field_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';

@Deprecated(
  'Removed as the firebase OTP system requires that the OTP be handled '
  'in one go, it does not seem possible to split up the process. Currently '
  'the OTP process is handled from within the reset password page',
)
class OtpPage extends StatelessWidget {
  final _otpController = TextEditingController();
  final _key = GlobalKey<FormState>();

  OtpPage();

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
                child: Form(
                  key: _key,
                  child: Column(
                    children: [
                       const HeaderWidget(
                      data: 'OTP',
                    ),
                    const SmallSpacerWidget(),
                    const DividerWidget(
                      height: 4.0,
                      width: 256.0,
                    ),
                    const SmallSpacerWidget(),
                      const IconWidget(
                        icon: Icons.perm_device_information_rounded,
                      ),
                      const HeadingTextWidget(
                        data: 'Enter your OTP',
                      ),
                      const SmallSpacerWidget(),
                      const DetailsTextWidget(
                        data: 'Enter your OTP below to reset your password',
                      ),
                      const MediumSpacerWidget(),
                      TextFormFieldWidget(
                        labelText: 'OTP',
                        keyboardType: TextInputType.number,
                        controller: _otpController,
                        icon: Icons.lock,
                        maxLength: 6,
                        validator: ValidationHelper.validateOtp,
                      ),
                      const LargeSpacerWidget(),
                      RoundedButtonWidget(
                        data: 'SUBMIT',
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            return;
                          } else {
                            //continue to next page
                          }
                        },
                      ),
                      const SmallSpacerWidget(),
                      TextButtonWidget(
                        data: 'Click to resend OTP',
                        onPressed: () {},
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
