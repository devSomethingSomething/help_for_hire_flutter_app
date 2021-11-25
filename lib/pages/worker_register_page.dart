import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/classes/job.dart';
import 'package:help_for_hire_flutter_app/helpers/connection_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/models/job_model.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/job_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/amount_time_checkbox_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/dividers/divider_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/gradients/blue_gradient_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/headers/header_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/jobs_dropdown_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/medium_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_fields/description_text_field.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';

class WorkerRegisterPage extends StatefulWidget {
  const WorkerRegisterPage();

  @override
  _WorkerRegisterPageState createState() => _WorkerRegisterPageState();
}

class _WorkerRegisterPageState extends State<WorkerRegisterPage> {
  final _key = GlobalKey<FormState>();

  bool _fullTime = false;
  bool _partTime = false;

  final _minimumFeeController = TextEditingController();
  final _descriptionController = TextEditingController();

  // final _jobsList = [
  //   Job(id: 1, jobName: 'Gardener'),
  //   Job(id: 2, jobName: 'House Cleaner'),
  //   Job(id: 3, jobName: 'Painter'),
  //   Job(id: 4, jobName: 'Brick Mason'),
  //   Job(id: 5, jobName: 'Tiling'),
  //   Job(id: 6, jobName: 'Tree Felling'),
  //   Job(id: 7, jobName: 'Plumber'),
  //   Job(id: 8, jobName: 'Electrician'),
  //   Job(id: 9, jobName: 'Window Cleaner'),
  //   Job(id: 10, jobName: 'Grocery Clerk'),
  //   Job(id: 11, jobName: 'Janitor'),
  //   Job(id: 12, jobName: 'Parking lot attendant'),
  //   Job(id: 13, jobName: 'Construction Worker'),
  //   Job(id: 14, jobName: 'Welder'),
  //   Job(id: 15, jobName: 'Scaffolder'),
  // ].map((job) => MultiSelectItem<Job>(job, job.jobName)).toList();

  @override
  void dispose() {
    _minimumFeeController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the list of jobs
    context.read<JobService>().getJobs();
    return Scaffold(
      body: Stack(
        children: [
          const BlueGradientWidget(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(
                16.0,
              ),
              child: Center(
                child: Column(
                  children: [
                    const HeaderWidget(
                      data: 'Worker Registration',
                    ),
                    const SmallSpacerWidget(),
                    const DividerWidget(
                      height: 4.0,
                      width: 256.0,
                    ),
                    const SmallSpacerWidget(),
                    const Text(
                      'Register a worker account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SmallSpacerWidget(),
                    Padding(
                      padding: const EdgeInsets.all(
                        16.0,
                      ),
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            DescriptionTextbox(
                              descriptionController: _descriptionController,
                              data: 'Description',
                              keyboardType: TextInputType.text,
                              maxLines: 3,
                              validator: ValidationHelper.validateDescription,
                            ),
                            const MediumSpacerWidget(),
                            // Need to somehow get the jobs from the dropdown here
                            Consumer<JobService>(
                              builder: (_, service, __) {
                                return JobsDropdownWidget(
                                  jobsList: service.jobs
                                      .map(
                                        (job) => MultiSelectItem<JobModel>(
                                          job,
                                          job.title,
                                        ),
                                      )
                                      .toList(),
                                  globalKey: _key,
                                );
                              },
                            ),
                            const MediumSpacerWidget(),
                            TextFormFieldWidget(
                              labelText: 'Minimum Fee',
                              keyboardType: TextInputType.number,
                              controller: _minimumFeeController,
                              icon: Icons.attach_money,
                            ),
                            const MediumSpacerWidget(),
                            AmountTimeCheckBox(
                              data: 'Full Time',
                              time: _fullTime,
                              onChanged: (value) {
                                setState(() {
                                  _fullTime = value!;
                                });
                              },
                            ),
                            AmountTimeCheckBox(
                              data: 'Part Time',
                              time: _partTime,
                              onChanged: (value) {
                                setState(() {
                                  _partTime = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SmallSpacerWidget(),
                    RoundedButtonWidget(
                      data: 'SUBMIT',
                      onPressed: () async {
                        if (_key.currentState!.validate()) {
                          if (await ConnectionHelper.hasConnection()) {
                            context.read<UserService>().currentUser =
                                WorkerModel(
                              description: _descriptionController.text,
                              minimumFee: int.parse(
                                _minimumFeeController.text,
                              ),
                              fullTime: _fullTime,
                              partTime: _partTime,
                              jobIds: context
                                  .read<JobService>()
                                  .selectedJobs
                                  .map(
                                    (job) => job.jobId,
                                  )
                                  .toList(),
                              user: context.read<UserService>().currentUser,
                            );

                            // Go to next page
                            Navigator.pushNamed(
                              context,
                              RouteManager.termsAndConditionsPage,
                            );
                          } else {
                            SnackBarHelper.showSnackBar(
                              context: context,
                              data: 'No internet connection',
                            );
                          }
                        } else {
                          SnackBarHelper.showSnackBar(
                            context: context,
                            data: 'Please complete all fields',
                          );
                        }
                      },
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
