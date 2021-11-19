import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      4.0,
                    ),
                    color: Colors.white,
                  ),
                  height: 4.0,
                  width: 256.0,
                ),
                const SmallSpacerWidget(),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Create an account with\nHelp For Hire!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                    ),
                  ),
                ),
                // Start of form
                Padding(
                  padding: const EdgeInsets.all(
                    16.0,
                  ),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: const [
                        TextFormFieldWidget(
                          labelText: 'ID Number',
                          icon: Icons.person,
                          keyboardType: TextInputType.number,
                        ),
                        SmallSpacerWidget(),
                        TextFormFieldWidget(
                          labelText: 'Name',
                          icon: Icons.text_format,
                          keyboardType: TextInputType.text,
                        ),
                        SmallSpacerWidget(),
                        TextFormFieldWidget(
                          labelText: 'Surname',
                          icon: Icons.text_fields,
                          keyboardType: TextInputType.text,
                        ),
                        SmallSpacerWidget(),
                        TextFormFieldWidget(
                          labelText: 'Phone Number',
                          icon: Icons.phone,
                          keyboardType: TextInputType.number,
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
                ButtonWidget(
                  data: 'CONTINUE',
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
                  child: const Padding(
                    padding: EdgeInsets.all(
                      8.0,
                    ),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteManager.accountTypePage,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
