// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/classes/job.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/amount_time_checkbox_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/jobs_dropdown_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/description_text_field.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/text_form_field_widget.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class WorkerRegisterPage extends StatefulWidget {
  const WorkerRegisterPage({Key? key}) : super(key: key);

  @override
  _WorkerRegisterPageState createState() => _WorkerRegisterPageState();
}

class _WorkerRegisterPageState extends State<WorkerRegisterPage> {
  final _minFeeController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _jobsList = [
    Job(id: 1, jobName: 'Gardener'),
    Job(id: 2, jobName: 'House Cleaner'),
    Job(id: 3, jobName: 'Painter'),
    Job(id: 4, jobName: 'Brick Mason'),
    Job(id: 5, jobName: 'Tiling'),
    Job(id: 6, jobName: 'Tree Felling'),
    Job(id: 7, jobName: 'Plumber'),
    Job(id: 8, jobName: 'Electrician'),
    Job(id: 9, jobName: 'Window Cleaner'),
    // added this for if a company wants to use the app
    Job(id: 10, jobName: 'Grocery Clerk'),
    Job(id: 11, jobName: 'Janitor'),
    Job(id: 12, jobName: 'Parking lot attendant'),
    Job(id: 13, jobName: 'Construction Worker'),
    Job(id: 14, jobName: 'Welder'),
    Job(id: 15, jobName: 'Scaffolder'),
  ].map((job) => MultiSelectItem<Job>(job, job.jobName)).toList();

  final _key = GlobalKey<FormState>();

  bool _fullTime = false;
  bool _partTime = false;

  @override
  void dispose() {
    _minFeeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                HeaderWidget(data: 'Worker Registration'),
                SmallSpacerWidget(),
                Text(
                  'You are registering as a worker!\nComplete the below in order to continue',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                MediumSpacerWidget(),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        DescriptionTextbox(
                          descriptionController: _descriptionController,
                          data: 'Description',
                          keyboardType: TextInputType.text,
                          maxLines: 5,
                          validator: ValidationHelper.validateDescription,
                        ),
                        MediumSpacerWidget(),
                        JobsDropdownWidget(
                          jobsList: _jobsList,
                          globalKey: _key,
                        ),
                        MediumSpacerWidget(),
                        TextFormFieldWidget(
                          labelText: 'Minimum fee',
                          keyboardType: TextInputType.number,
                          controller: _minFeeController,
                          icon: Icons.attach_money,
                          validator: ValidationHelper.validateFee,
                        ),
                        MediumSpacerWidget(),
                        AmountTimeCheckBox(
                          data: 'Full Time',
                          time: _fullTime,
                          onChanged: (value) {
                            setState(() {
                              _fullTime = value!;
                              _partTime = false;
                            });
                          },
                        ),
                        AmountTimeCheckBox(
                          data: 'Part Time',
                          time: _partTime,
                          onChanged: (value) {
                            setState(() {
                              _partTime = value!;
                              _fullTime = false;
                            });
                          },
                        ),
                        SmallSpacerWidget(),
                        RoundedButtonWidget(
                          data: 'Submit and Continue',
                          onPressed: () {
                            if (_descriptionController.text.isEmpty ||
                                _key.currentState!.validate() == false ||
                                _minFeeController.text.isEmpty ||
                                _fullTime == false && _partTime == false) {
                              SnackBarHelper.showSnackBar(
                                  context: context,
                                  data: 'Please complete all fields');
                            } else {
                              Navigator.pushNamed(context,
                                  RouteManager.registrationSuccessPage);
                            }
                          },
                        ),
                      ],
                    ),
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
