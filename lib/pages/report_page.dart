/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/report_constants.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/info_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/snack_bar_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';
import 'package:help_for_hire_flutter_app/models/report_model.dart';
import 'package:help_for_hire_flutter_app/services/report_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';

/// This page allows a user to report another user
class ReportPage extends StatefulWidget {
  /// Constructor
  const ReportPage();

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  /// The _key variable is used to validate form fields
  final _key = GlobalKey<FormState>();

  /// Variables for the Text editing controllers
  final _descriptionController = TextEditingController();

  /// Method dispose is used to clear any controllers when the page is built
  @override
  void dispose() {
    _descriptionController.dispose();

    super.dispose();
  }

  /// Handles logic for this page
  void _onPressed() async {
    ValidationHelper.validateForm(
      context: context,
      key: _key,
      function: () => ValidationHelper.checkConnection(
        context: context,
        function: () async {
          DelayHelper.showLoadingIndicator(context: context);

          await context.read<ReportService>().postReport(
                report: ReportModel(
                  reportId: '',
                  reportType: context.read<ReportService>().selectedReportType,
                  description: _descriptionController.text,
                  // Need to figure out where we get the id from
                  // Depends on the other pages for this
                  // reportedUserId: '1234567891234',
                  reportedUserId:
                      context.read<WorkerService>().worker?.userId ?? '',
                  reporterUserId:
                      context.read<UserService>().currentUser.userId,
                  // Put this back later after testing
                  // context.read<UserService>().currentUser.userId,
                ),
              );

          DelayHelper.hideLoadingIndicator(context: context);

          if (!context.read<ReportService>().isDuplicate) {
            // Go back a page
            Navigator.pop(context);
          } else {
            SnackBarHelper.showSnackBar(
              context: context,
              data: 'Cannot report the same user twice',
            );
          }
        },
      ),
    );
  }

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    // Set the report type back to the default value
    context.read<ReportService>().defaultReportType();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info_outline_rounded,
            ),

            /// Dialog that displays what the page is for
            onPressed: () => InfoHelper.showInfoDialog(
              context: context,
              content:
                  'This page allows you to file a report against another user',
              title: 'Report Details',
            ),
          ),
        ],
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Report',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Icon(
                Icons.report,
                color: Colors.orange,
                size: 128.0,
              ),
              const SmallSpacerWidget(),
              const Text(
                'Report User',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SmallSpacerWidget(),
              const Text(
                'Please fill out the form below to file a report',
                style: TextStyle(
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              const LargeSpacerWidget(),
              Form(
                child: Column(
                  children: [
                    // Requires validation
                    // Perhaps should display report types based on user type
                    Consumer<ReportService>(
                      builder: (_, service, __) {
                        return DropdownButtonFormField<String>(
                          hint: Text(
                            service.selectedReportType,
                          ),
                          iconSize: 32.0,
                          isExpanded: true,

                          /// Displays the different report types in a drop down
                          items: ReportConstants.reportTypes
                              .map(
                                (item) => DropdownMenuItem(
                                  child: Text(
                                    item,
                                  ),
                                  value: item,
                                ),
                              )
                              .toList(),
                          onChanged: (item) =>
                              service.selectedReportType = item.toString(),
                        );
                      },
                    ),
                    const SmallSpacerWidget(),

                    /// Text form field
                    ///
                    /// The description text form field does not need validation
                    /// because it is optional
                    TextFormFieldWidget(
                      controller: _descriptionController,
                      icon: Icons.description_rounded,
                      keyboardType: TextInputType.text,
                      labelText: 'Description',
                      lightMode: true,
                      maxLength: 256,
                      maxLines: 5,
                    ),
                  ],
                ),
                key: _key,
              ),
              const LargeSpacerWidget(),
              RoundedButtonWidget(
                data: 'SUBMIT',
                invertColors: true,
                onPressed: _onPressed,
              ),
            ],
          ),
        ),
        padding: const EdgeInsets.all(
          32.0,
        ),
      ),
    );
  }
}
