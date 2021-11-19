import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage();

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _key = GlobalKey<FormState>();

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
                        TextFormFieldWidget(
                          labelText: 'ID Number',
                          icon: Icons.person,
                          keyboardType: TextInputType.number,
                        ),
                        const SmallSpacerWidget(),
                        TextFormFieldWidget(
                          labelText: 'Name',
                          icon: Icons.text_format,
                          keyboardType: TextInputType.text,
                        ),
                        const SmallSpacerWidget(),
                        TextFormFieldWidget(
                          labelText: 'Surname',
                          icon: Icons.text_fields,
                          keyboardType: TextInputType.text,
                        ),
                        const SmallSpacerWidget(),
                        TextFormFieldWidget(
                          labelText: 'Phone Number',
                          icon: Icons.phone,
                          keyboardType: TextInputType.number,
                        ),
                        const SmallSpacerWidget(),
                        TextFormFieldWidget(
                          labelText: 'Password',
                          icon: Icons.password,
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        // DropdownButton(
                        //   dropdownColor: Colors.blue[900],
                        //   iconEnabledColor: Colors.white,
                        //   isExpanded: true,
                        //   items: [
                        //     'Province',
                        //     'Bloemfontein',
                        //     'Welkom',
                        //   ]
                        //       .map(
                        //         (value) => DropdownMenuItem(
                        //           value: value,
                        //           child: Text(
                        //             value,
                        //             style: const TextStyle(
                        //               color: Colors.white,
                        //             ),
                        //           ),
                        //         ),
                        //       )
                        //       .toList(),
                        //   onChanged: (value) {},
                        //   value: 'Province',
                        // ),
                      ],
                    ),
                  ),
                ),
                const SmallSpacerWidget(),
                RoundedButtonWidget(
                  data: 'SUBMIT',
                  onPressed: () {},
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
