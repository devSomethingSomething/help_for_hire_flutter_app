import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/report_constants.dart';
import 'package:help_for_hire_flutter_app/helpers/info_helper.dart';
import 'package:help_for_hire_flutter_app/services/report_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/large_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:provider/provider.dart';

class ReportPage extends StatefulWidget {
  const ReportPage();

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();

    super.dispose();
  }

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
              // Requires validation
              // Wrap with form
              Consumer<ReportService>(
                builder: (_, service, __) {
                  return DropdownButtonFormField<String>(
                    hint: Text(
                      service.selectedReportType,
                    ),
                    iconSize: 32.0,
                    isExpanded: true,
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
              TextFormFieldWidget(
                controller: _descriptionController,
                icon: Icons.description_rounded,
                keyboardType: TextInputType.text,
                labelText: 'Description',
                lightMode: true,
                maxLength: 256,
                maxLines: 5,
              ),
              const LargeSpacerWidget(),
              // Requires validation
              // Should check for duplicate reports
              // Will require a change to the report model and controller
              // Report service also needs work
              // Should check the combo of reportedUserId and reporterUserId
              RoundedButtonWidget(
                data: 'SUBMIT',
                invertColors: true,
                onPressed: () {},
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
