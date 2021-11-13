import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/icons/icon_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/details_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/heading_text_widget.dart';

class ResetPasswordSuccessPage extends StatelessWidget {
  const ResetPasswordSuccessPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        data: 'Reset password success',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Center(
          child: Column(
            children: [
              const IconWidget(
                icon: Icons.check_circle,
              ),
              const HeadingTextWidget(
                data: 'Reset Password Successfully',
              ),
              const SmallSpacerWidget(),
              const DetailsTextWidget(
                data:
                    'You have successfully reset your password and may now sign in',
              ),
              const LargeSpacerWidget(),
              ButtonWidget(
                data: 'SIGN IN',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteManager.signInPage,
                    (_) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
