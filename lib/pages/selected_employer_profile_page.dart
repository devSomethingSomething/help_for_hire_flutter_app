// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';

// This page is currently broken
class SelectedEmployerProfilePage extends StatefulWidget {
  SelectedEmployerProfilePage({
    Key? key,
    this.employer,
  }) : super(
          key: key,
        );
  final EmployerModel? employer;

  @override
  State<SelectedEmployerProfilePage> createState() =>
      _SelectedEmployerProfilePageState();
}

class _SelectedEmployerProfilePageState
    extends State<SelectedEmployerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        data: 'Profile',
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.account_circle,
                size: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  //'Name Surname',
                  '${widget.employer!.name} ${widget.employer!.surname}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => Navigator.popAndPushNamed(
                          context,
                          RouteManager.reviewPage,
                        ),
                        child: Text(
                          'Rate user',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => Navigator.popAndPushNamed(
                          context,
                          RouteManager.reportPage,
                        ),
                        child: Text(
                          'Report user',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Location',
                //'${widget.employer.location}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () => Navigator.popAndPushNamed(
                    context,
                    RouteManager.historyPage,
                  ),
                  child: Text(
                    'View this users History ',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
