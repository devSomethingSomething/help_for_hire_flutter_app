import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/text_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/icons/icon_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/password_text_field_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/text_field_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Sign in',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const IconWidget(
                icon: Icons.person,
              ),
              const HeadingTextWidget(
                data: 'Sign In',
              ),
              const MediumSpacerWidget(),
              const TextFieldWidget(
                data: 'ID number',
                keyboardType: TextInputType.number,
              ),
              const SmallSpacerWidget(),
              const PasswordTextFieldWidget(
                data: 'Password',
                keyboardType: TextInputType.text,
              ),
              const MediumSpacerWidget(),
              ButtonWidget(
                data: 'SUBMIT',
                onPressed: () {
                  ConnectionHelper.checkConnection(context);
                },
              ),
              const SmallSpacerWidget(),
              TextButtonWidget(
                data: 'Reset password',
                onPressed: () {},
              ),
              TextButtonWidget(
                data: 'Register',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
