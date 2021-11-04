import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/details_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/expanded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/icon_widget.dart';

class ResetPasswordSuccessPage extends StatelessWidget {
  const ResetPasswordSuccessPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Reset password success',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Center(
          child: Column(
            children: const [
              IconWidget(
                icon: Icons.check_circle,
              ),
              HeadingTextWidget(
                data: 'Reset Password Successfully',
              ),
              SizedBox(
                height: 20.0,
              ),
              DetailsTextWidget(
                data:
                    'You have successfully reset your password and may now sign in',
              ),
              SizedBox(
                height: 50.0,
              ),
              ExpandedButtonWidget(
                data: 'SIGN IN',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
