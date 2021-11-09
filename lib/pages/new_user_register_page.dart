// ignore_for_file: prefer_const_constructors, unused_element, deprecated_member_use, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dropdown_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_field_widget.dart';

class NewUserRegisterPage extends StatefulWidget {
  const NewUserRegisterPage({Key? key}) : super(key: key);

  @override
  State<NewUserRegisterPage> createState() => _NewUserRegisterPageState();
}

class _NewUserRegisterPageState extends State<NewUserRegisterPage> {
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
            title: 'Register',
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
                    controllerData: nameController,
                    obscureText: false,
                    icon: false,
                  ),
                  TextFieldWidget(
                    data: 'Surname',
                    controllerData: surnameController,
                    obscureText: false,
                    icon: false,
                  ),
                  TextFieldWidget(
                    data: 'ID Number',
                    controllerData: idNumberController,
                    obscureText: false,
                    icon: false,
                  ),
                  TextFieldWidget(
                    data: 'Phone Number',
                    controllerData: phoneNumberController,
                    icon: false,
                    obscureText: false,
                  ),
                  TextFieldWidget(
                    data: 'Password',
                    controllerData: passwordController,
                    obscureText: true,
                    icon: true,
                  ),
                  TextFieldWidget(
                    data: 'Confirm Password',
                    controllerData: confirmPasswordController,
                    obscureText: true,
                    icon: true,
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
                      // Push to Account Type Page
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
