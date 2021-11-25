import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/password_text_field_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage();

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController confirmNewPasswordController =
        TextEditingController();
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: const AppBarWidget(
        data: 'Change password',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.lock_outline_rounded,
                  size: 144.0,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Change your Password',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Enter old password'),
                  keyboardType: TextInputType.visiblePassword,
                  controller: oldPasswordController,
                  validator: ValidationHelper.validatePassword,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Enter new password'),
                  keyboardType: TextInputType.text,
                  controller: newPasswordController,
                  validator: ValidationHelper.validatePassword,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Repeat new password'),
                  keyboardType: TextInputType.text,
                  controller: confirmNewPasswordController,
                  validator: ValidationHelper.validatePassword,
                ),
                const SizedBox(
                  height: 50,
                ),
                RoundedButtonWidget(
                  data: 'Submit',
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      return;
                    } else {
                      //continue to next page
                    }
                  },
                  invertColors: true,
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
