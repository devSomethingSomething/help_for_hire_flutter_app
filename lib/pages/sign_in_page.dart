import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/firebase_service.dart';
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
  // This page requires validation logic for the text fields
  // ID validation
  // Password validation
  // Put these methods in the validation helper class
  final _idNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  SignInPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        data: 'Sign in',
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
              TextFieldWidget(
                data: 'ID number',
                keyboardType: TextInputType.number,
                controller: _idNumberController,
              ),
              const SmallSpacerWidget(),
              PasswordTextFieldWidget(
                data: 'Password',
                keyboardType: TextInputType.text,
                controller: _passwordController,
              ),
              const MediumSpacerWidget(),
              ButtonWidget(
                data: 'SUBMIT',
                onPressed: () async {
                  final hasConnection =
                      await ConnectionHelper.checkConnection(context);

                  // Requires check for correct login so that the app knows
                  // to move on to the next page
                  // Will require changing the firebase services sign in
                  // method
                  if (hasConnection) {
                    FirebaseService.signInUser(
                      context: context,
                      id: _idNumberController.text,
                      password: _passwordController.text,
                    );
                  }
                },
              ),
              const SmallSpacerWidget(),
              TextButtonWidget(
                data: 'Reset password',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteManager.resetPasswordPage,
                  );
                },
              ),
              TextButtonWidget(
                data: 'Register',
                onPressed: () {
                  // Navigator.pushNamed(context, RouteManager.registrationPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
