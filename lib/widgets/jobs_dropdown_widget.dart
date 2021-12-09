/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/job_model.dart';
import 'package:help_for_hire_flutter_app/services/job_service.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

/// Custom Drop down widget for the jobs drop down button in
/// the worker registration page
class JobsDropdownWidget extends StatefulWidget {
  /// Variables
  final List<MultiSelectItem<JobModel>> _jobsList;

  /// The _key variable is used to validate form fields
  final GlobalKey<FormState> _globalKey;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const JobsDropdownWidget({
    required List<MultiSelectItem<JobModel>> jobsList,
    required GlobalKey<FormState> globalKey,
  })  : _jobsList = jobsList,
        _globalKey = globalKey;

  @override
  State<JobsDropdownWidget> createState() => _JobsDropdownWidgetState();
}

class _JobsDropdownWidgetState extends State<JobsDropdownWidget> {
  /// Variables
  List<JobModel> _selectedJobs = [];

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField(
      items: widget._jobsList,
      title: const Text(
        'Jobs',
      ),
      selectedColor: Colors.blue,
      searchable: true,
      validator: (values) {
        if (values == null || values.isEmpty) {
          return 'Required*';
        }

        return null;
      },

      /// Displays the selected jobs in a chip format
      ///
      /// When the chip is pressed it will delete the selected job
      chipDisplay: MultiSelectChipDisplay(
        chipColor: Colors.white,
        onTap: (value) {
          setState(
            () {
              _selectedJobs.remove(value);
            },
          );

          widget._globalKey.currentState!.validate();
        },
        textStyle: TextStyle(
          color: Colors.blue[900],
          fontSize: 16.0,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            40.0,
          ),
        ),
      ),
      buttonText: const Text(
        'Select one or more job(s)',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      buttonIcon: const Icon(
        Icons.arrow_downward,
        color: Colors.white,
      ),
      onConfirm: (results) {
        setState(
          () {
            _selectedJobs = results.cast<JobModel>();
          },
        );

        context.read<JobService>().selectedJobs = _selectedJobs;

        widget._globalKey.currentState!.validate();
      },
    );
  }
}
