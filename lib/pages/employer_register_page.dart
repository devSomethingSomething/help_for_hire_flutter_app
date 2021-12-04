// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';

class EmployerRegisterPage extends StatefulWidget {
  const EmployerRegisterPage({Key? key}) : super(key: key);

  @override
  _EmployerRegisterPageState createState() => _EmployerRegisterPageState();
}

class _EmployerRegisterPageState extends State<EmployerRegisterPage> {
  final _key = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _suburbController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BlueGradientWidget(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    const HeaderWidget(
                      data: 'Employer Registration',
                    ),
                    const SmallSpacerWidget(),
                    const DividerWidget(
                      height: 4.0,
                      width: 256.0,
                    ),
                    const SmallSpacerWidget(),
                    const Text(
                      'Register an employer account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SmallSpacerWidget(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              labelText: 'Company name (optional)',
                              keyboardType: TextInputType.text,
                              controller: _companyNameController,
                              icon: Icons.business,

                              // if company name is empty assign N/A to it
                            ),
                            const MediumSpacerWidget(),
                            TextFormFieldWidget(
                                labelText: 'Address',
                                keyboardType: TextInputType.text,
                                controller: _addressController,
                                icon: Icons.house,
                                validator:
                                    ValidationHelper.validateDescription),
                            const MediumSpacerWidget(),
                            TextFormFieldWidget(
                                labelText: 'Suburb',
                                keyboardType: TextInputType.text,
                                controller: _suburbController,
                                icon: Icons.home_work,
                                validator:
                                    ValidationHelper.validateDescription),
                            const MediumSpacerWidget(),
                            RoundedButtonWidget(
                              data: 'SUBMIT',
                              onPressed: () {
                                if (_key.currentState!.validate()) {
                                  return;
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    RouteManager.termsAndConditionsPage,
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
