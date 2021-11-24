import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/icons/icon_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/details_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/password_text_field_widget.dart';

class NewPasswordPage extends StatelessWidget {
  final _newPasswordController = TextEditingController();
  final _repeatNewPasswordController = TextEditingController();

  NewPasswordPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(
        data: 'New password',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
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
              PasswordTextFieldWidget(
                data: 'New password',
                keyboardType: TextInputType.text,
                controller: _newPasswordController,
              ),
              const SmallSpacerWidget(),
              PasswordTextFieldWidget(
                data: 'Repeat new password',
                keyboardType: TextInputType.text,
                controller: _repeatNewPasswordController,
              ),
              const LargeSpacerWidget(),
              RoundedButtonWidget(
                data: 'SUBMIT',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteManager.resetPasswordSuccessPage,
                  );
                },
                invertColors: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
