// ignore_for_file: prefer_const_constructors, unused_element, deprecated_member_use, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dropdown_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/password_text_field_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double paddingbottom = 15;
    double paddingLeft = 20;
    double paddingRight = 20;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBarWidget(
            data: 'Register',
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 20),
                    child: Text(
                      'Please complete the below information',
                    ),
                  ),
                  TextFieldWidget(
                    data: 'Name',
                    keyboardType: TextInputType.text,
                    controller: nameController,
                  ),
                  TextFieldWidget(
                    data: 'Surname',
                    keyboardType: TextInputType.text,
                    controller: surnameController,
                  ),
                  TextFieldWidget(
                    data: 'ID Number',
                    keyboardType: TextInputType.text,
                    controller: idNumberController,
                  ),
                  TextFieldWidget(
                    data: 'Phone Number',
                    keyboardType: TextInputType.number,
                    controller: phoneNumberController,
                  ),
                  PasswordTextFieldWidget(
                    data: 'Password',
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                  ),
                  PasswordTextFieldWidget(
                    data: 'Confirm Password',
                    keyboardType: TextInputType.text,
                    controller: confirmPasswordController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropDownWidget(
                    paddingbottom: paddingbottom,
                    paddingLeft: paddingLeft,
                    paddingRight: paddingRight,
                    hint: 'Province',
                    items: [
                      'Free State',
                      'Eastern Cape',
                      'Western Cape',
                      'Nothern Cape',
                      'North West',
                      'Limpopo',
                      'Gauteng',
                      'Mpumalanga',
                      'KwaZulu-Natal',
                    ],
                  ),
                  DropDownWidget(
                    paddingbottom: paddingbottom,
                    paddingLeft: paddingLeft,
                    paddingRight: paddingRight,
                    hint: 'City',
                    items: [
                      'Bloemfontein',
                      'Cape Town',
                      'Bhisho',
                      'Johannesburg',
                      'Pietermaritzburg',
                      'Polokwane',
                      'Mbombela',
                      'Kimberley',
                      'Mahikeng',
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, RouteManager.accountTypePage);
                    },
                    child: Text(
                      'Submit and Continue',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
