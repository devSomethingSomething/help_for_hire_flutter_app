// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';

class SelectedWorkerProfilePage extends StatelessWidget {
  // const SelectedWorkerProfilePage({
  //   Key? key,

  // }) : super(key: key);

  WorkerModel? worker;

  @override
  Widget build(BuildContext context) {
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
                '${worker?.name} ${worker?.surname}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButtonWidget(
                      onPressed: () {},
                      primary: Colors.blue,
                      data: 'Rate user',
                    ),
                    FlatButtonWidget(
                      onPressed: () {},
                      primary: Colors.blue,
                      data: 'Report user',
                    ),
                  ],
                ),
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
                          '${worker?.description}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Minimum fee: ${worker?.minimumFee}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  // worker.fullTime ? Text('Full Time') : Container(),
                  // worker.partTime ? Text('Part Time') : Container(),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'and so on...',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButtonWidget(
                onPressed: () {},
                primary: Colors.blue,
                data: 'View this users History',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
