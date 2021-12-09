/// Imports
import 'package:flutter/material.dart';
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

/// This page handles worker registration
class WorkerRegisterPage extends StatefulWidget {
  /// Constructor
  const WorkerRegisterPage();

  /// Creates the state for this page
  @override
  _WorkerRegisterPageState createState() => _WorkerRegisterPageState();
}

/// The state class for the worker register page
class _WorkerRegisterPageState extends State<WorkerRegisterPage> {
  /// Used for form validation
  final _key = GlobalKey<FormState>();

  /// Used for storing the selected value for the kind of work the user is looking
  /// to take on
  bool _fullTime = false;
  bool _partTime = false;

  /// Controllers
  final _minimumFeeController = TextEditingController();
  final _descriptionController = TextEditingController();

  /// Cleans up any unused objects or resources
  @override
  void dispose() {
    _minimumFeeController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  /// Builds the widget
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
                              color: Colors.white,
                              descriptionController: _descriptionController,
                              data: 'Description',
                              keyboardType: TextInputType.text,
                              maxLines: 3,
                              validator: ValidationHelper.validateDescription,
                            ),
                            const MediumSpacerWidget(),
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
                              labelText: 'Minimum Fee per day',
                              keyboardType: TextInputType.number,
                              controller: _minimumFeeController,
                              icon: Icons.attach_money,
                            ),
                            const MediumSpacerWidget(),
                            AmountTimeCheckBox(
                              data: 'Full Time',
                              time: _fullTime,
                              color: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  _fullTime = value!;
                                });
                              },
                            ),
                            AmountTimeCheckBox(
                              data: 'Part Time',
                              color: Colors.white,
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
                        // Validate the form
                        if (_key.currentState!.validate()) {
                          // Check the connection
                          if (await ConnectionHelper.hasConnection()) {
                            // Setup the current user, used for registering
                            // the user later
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

                            // Go to the next page
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
