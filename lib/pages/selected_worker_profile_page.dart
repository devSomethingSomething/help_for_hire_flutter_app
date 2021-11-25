// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/text_button_widget.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

class SelectedWorkerProfilePage extends StatelessWidget {
  // const SelectedWorkerProfilePage({
  //   Key? key,

  // }) : super(key: key);

  WorkerModel? worker;

  @override
  Widget build(BuildContext context) {
    context.read<WorkerService>().getWorker;

    return Scaffold(
      appBar: AppBarWidget(
        data: 'Profile',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.account_circle,
                size: 150,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'John Doe',
                //'${worker?.name} ${worker?.surname}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Description',
                          //'${worker?.description}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Minimum Fee: R150',
                    //'Minimum fee: ${worker?.minimumFee}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Full Time',
                    //'Full Time: ${worker?.fullTime}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Part Time',
                    //'Part Time: ${worker?.partTime}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  // worker.fullTime ? Text('Full Time') : Container(),
                  // worker.partTime ? Text('Part Time') : Container(),

                  // add list of skills
                  // list view builder
                  Text('List skills here')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // put at bottom

                    FlatButtonWidget(
                      onPressed: () {},
                      primary: Colors.blue,
                      data: 'Rate user',
                    ),
                    FlatButtonWidget(
                      onPressed: () {},
                      primary: Colors.blue,
                      data: 'View this users History',
                    ),
                    FlatButtonWidget(
                      onPressed: () {},
                      primary: Colors.blue,
                      data: 'Report user',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
