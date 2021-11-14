import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/services/firebase_service.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/icons/icon_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/details_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/text_field_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  final _phoneNumberController = TextEditingController();

  ResetPasswordPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        data: 'Reset password',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const IconWidget(
                icon: Icons.lock_outline_rounded,
              ),
              const HeadingTextWidget(
                data: 'Reset your Password',
              ),
              const SmallSpacerWidget(),
              const DetailsTextWidget(
                data: 'Enter your phone number below to reset your password',
              ),
              const MediumSpacerWidget(),
              TextFieldWidget(
                data: 'Phone number',
                keyboardType: TextInputType.number,
                controller: _phoneNumberController,
              ),
              const LargeSpacerWidget(),
              ButtonWidget(
                data: 'SUBMIT',
                onPressed: () {
                  FirebaseService.handleOtp(
                    context: context,
                    phoneNumber: _phoneNumberController.text,
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
