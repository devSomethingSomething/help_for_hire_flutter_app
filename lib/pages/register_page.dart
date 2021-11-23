import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/firebase_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage();

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();

  final _idNumberController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _idNumberController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Center(
            child: Column(
              children: [
                const HeaderWidget(
                  data: 'Register',
                ),
                const SmallSpacerWidget(),
                const DividerWidget(
                  height: 4.0,
                  width: 256.0,
                ),
                const SmallSpacerWidget(),
                const Text(
                  'Create an account with\nHelp For Hire!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        // This field requires validation
                        TextFormFieldWidget(
                          controller: _idNumberController,
                          labelText: 'ID Number',
                          icon: Icons.person,
                          keyboardType: TextInputType.number,
                          maxLength: 13,
                        ),
                        const SmallSpacerWidget(),
                        // Needs better validation
                        TextFormFieldWidget(
                          controller: _nameController,
                          labelText: 'Name',
                          icon: Icons.text_format,
                          keyboardType: TextInputType.text,
                          validator: ValidationHelper.validateText,
                        ),
                        const SmallSpacerWidget(),
                        // Needs better validation
                        TextFormFieldWidget(
                          controller: _surnameController,
                          labelText: 'Surname',
                          icon: Icons.text_fields,
                          keyboardType: TextInputType.text,
                          validator: ValidationHelper.validateText,
                        ),
                        const SmallSpacerWidget(),
                        TextFormFieldWidget(
                          controller: _phoneNumberController,
                          labelText: 'Phone Number',
                          icon: Icons.phone,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          validator: ValidationHelper.validatePhoneNumber,
                        ),
                        const SmallSpacerWidget(),
                        // This field requires validation
                        TextFormFieldWidget(
                          controller: _passwordController,
                          labelText: 'Password',
                          icon: Icons.password,
                          keyboardType: TextInputType.text,
                          maxLength: 24,
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                ),
                const SmallSpacerWidget(),
                RoundedButtonWidget(
                  data: 'SUBMIT',
                  onPressed: () async {
                    // This needs to be cleaned up later on
                    if (_key.currentState!.validate()) {
                      if (await ConnectionHelper.hasConnection()) {
                        if (FirebaseService.isNotExistingUser(
                          id: _idNumberController.text,
                          password: _passwordController.text,
                        )) {
                          context.read<UserService>().currentUser = UserModel(
                            userId: _idNumberController.text,
                            name: _nameController.text,
                            surname: _surnameController.text,
                            phoneNumber: _phoneNumberController.text,
                            locationId: '',
                          );

                          // Add navigation logic here
                        } else {
                          SnackBarHelper.showSnackBar(
                            context: context,
                            data: 'Duplicate user details',
                          );
                        }
                      } else {
                        SnackBarHelper.showSnackBar(
                          context: context,
                          data: 'No internet connection',
                        );
                      }
                    } else {
                      SnackBarHelper.showSnackBar(
                        context: context,
                        data: 'Some fields are invalid',
                      );
                    }
                  },
                ),
                const SmallSpacerWidget(),
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => Navigator.popAndPushNamed(
                    context,
                    RouteManager.signInPage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
