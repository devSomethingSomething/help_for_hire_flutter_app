import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/text_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/icons/icon_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/details_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/text_field_widget.dart';

class OtpPage extends StatelessWidget {
  final _otpController = TextEditingController();

  OtpPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'OTP',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
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
              TextFieldWidget(
                data: 'OTP',
                keyboardType: TextInputType.number,
                controller: _otpController,
              ),
              const LargeSpacerWidget(),
              ButtonWidget(
                data: 'SUBMIT',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteManager.newPasswordPage,
                  );
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
    );
  }
}
