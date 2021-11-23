// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/classes/job.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class JobsDropdownWidget extends StatefulWidget {
  JobsDropdownWidget({
    Key? key,
    required List<MultiSelectItem<Job>> jobsList,
    required GlobalKey<FormState> globalKey,
  })  : _jobsList = jobsList,
        _key = globalKey,
        super(key: key);

  List<MultiSelectItem<Job>> _jobsList;
  //final _key = GlobalKey<FormState>();
  GlobalKey<FormState> _key;

  @override
  State<JobsDropdownWidget> createState() => _JobsDropdownWidgetState();
}

class _JobsDropdownWidgetState extends State<JobsDropdownWidget> {
  List<Job> _selectedJobs = [];

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField(
      items: widget._jobsList,
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
          widget._key.currentState!.validate();
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
        widget._key.currentState!.validate();
      },
    );
  }
}
