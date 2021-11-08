import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/details_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/expanded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/icon_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_field_widget.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'New password',
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
              const SizedBox(
                height: 20.0,
              ),
              const DetailsTextWidget(
                data: '''Enter your new password below to complete
                the password reset process''',
              ),
              const SizedBox(
                height: 50.0,
              ),
              TextFieldWidget(
                data: 'New password',
                obscureText: true,
                icon: true,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFieldWidget(
                data: 'Repeat new password',
                obscureText: true,
                icon: true,
              ),
              const SizedBox(
                height: 50.0,
              ),
              const ExpandedButtonWidget(
                data: 'SUBMIT',
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
