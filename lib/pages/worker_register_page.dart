// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/classes/job.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/text_field_widget.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

enum AmountTime { full, part }

class WorkerRegisterPage extends StatefulWidget {
  const WorkerRegisterPage({Key? key}) : super(key: key);

  @override
  _WorkerRegisterPageState createState() => _WorkerRegisterPageState();
}

class _WorkerRegisterPageState extends State<WorkerRegisterPage> {
  TextEditingController minFeeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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

  List<Job> _selectedJobs = [];
  final _key = GlobalKey<FormState>();
  AmountTime? _time;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBarWidget(
          data: 'Worker Register',
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SmallSpacerWidget(),
                Text(
                  'Complete the below in order to continue',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                MediumSpacerWidget(),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textCapitalization: TextCapitalization.sentences,
                          maxLines: 3,
                          controller: descriptionController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            labelText: 'Description',
                          ),
                        ),
                        MediumSpacerWidget(),
                        MultiSelectDialogField(
                          items: _jobsList,
                          title: Text("Jobs"),
                          selectedColor: Colors.blue,
                          searchable: true,
                          validator: (values) {
                            if (values == null || values.isEmpty) {
                              return 'Required*';
                            }
                            return null;
                          },
                          chipDisplay: MultiSelectChipDisplay(
                            onTap: (value) {
                              setState(() {
                                _selectedJobs.remove(value);
                              });
                              _key.currentState!.validate();
                            },
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          buttonText: Text(
                            "Select one or more job(s)",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          buttonIcon: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          onConfirm: (results) {
                            setState(() {
                              _selectedJobs = results.cast<Job>();
                            });
                            _key.currentState!.validate();
                          },
                        ),
                        MediumSpacerWidget(),
                        TextFieldWidget(
                          data: 'Minimum fee',
                          keyboardType: TextInputType.number,
                          controller: minFeeController,
                        ),
                        MediumSpacerWidget(),
                        ListTile(
                          title: Text(
                            'Full time',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          leading: Radio<AmountTime>(
                            value: AmountTime.full,
                            groupValue: _time,
                            onChanged: (AmountTime? value) {
                              setState(() {
                                _time = value;
                              });
                            },
                            activeColor: Colors.orange,
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Part time',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          leading: Radio<AmountTime>(
                            value: AmountTime.part,
                            groupValue: _time,
                            onChanged: (AmountTime? value) {
                              setState(() {
                                _time = value;
                              });
                            },
                            activeColor: Colors.orange,
                          ),
                        ),
                        SmallSpacerWidget(),
                        ElevatedButton(
                          onPressed: () {
                            if (descriptionController.text.isEmpty ||
                                _key.currentState!.validate() == false ||
                                minFeeController.text.isEmpty) {
                              // Not sure how to validate the enums
                              // Need to add pop up notification
                              print('Please complete all fields');
                            } else {
                              Navigator.pushNamed(context,
                                  RouteManager.registrationSuccessPage);
                            }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
