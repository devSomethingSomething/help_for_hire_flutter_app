// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/classes/checkbox_state.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bar_widget.dart';

enum AmountTime { full, part }

class WorkerRegisterPage extends StatefulWidget {
  const WorkerRegisterPage({Key? key}) : super(key: key);

  @override
  _WorkerRegisterPageState createState() => _WorkerRegisterPageState();
}

class _WorkerRegisterPageState extends State<WorkerRegisterPage> {
  TextEditingController minFeeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final jobs = [
    CheckBoxState(title: 'Gardener'),
    CheckBoxState(title: 'House Cleaner'),
    CheckBoxState(title: 'Painter'),
    CheckBoxState(title: 'Brick Layer'),
    CheckBoxState(title: 'Tiling'),
  ];

  AmountTime? _time = AmountTime.part;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Worker Register',
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 20,
                ),
                Text('Complete the below in order to continue'),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  height: 120,
                  child: TextField(
                    maxLines: 5,
                    controller: descriptionController,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      labelText: 'Description',
                    ),
                  ),
                ),
                Text('Select the below jobs you can do:'),
                ...jobs.map(buildSingleCheckBox).toList(),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    controller: minFeeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      labelText: 'Minimum Fee',
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Full time'),
                  leading: Radio<AmountTime>(
                    value: AmountTime.full,
                    groupValue: _time,
                    onChanged: (AmountTime? value) {
                      setState(() {
                        _time = value;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('Part time'),
                  leading: Radio<AmountTime>(
                    value: AmountTime.part,
                    groupValue: _time,
                    onChanged: (AmountTime? value) {
                      setState(() {
                        _time = value;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Submit and Continue',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSingleCheckBox(CheckBoxState checkbox) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        value: checkbox.value,
        onChanged: (value) {
          setState(() {
            checkbox.value = value!;
          });
        },
        title: Text(checkbox.title),
      );
}
