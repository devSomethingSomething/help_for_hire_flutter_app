// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bar_widget.dart';

enum Accounts { worker, employer }

class AccountTypePage extends StatefulWidget {
  const AccountTypePage({Key? key}) : super(key: key);

  @override
  _AccountTypePageState createState() => _AccountTypePageState();
}

class _AccountTypePageState extends State<AccountTypePage> {
  Accounts? _account ;
  bool? accountType = null; 
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Account',
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text('Choose account type'),
              ),
              ListTile(
                title: Text('Worker'),
                leading: Radio<Accounts>(
                  value: Accounts.worker,
                  groupValue: _account,
                  onChanged: (Accounts? value) {
                    setState(() {
                      _account = value;
                      accountType=true;
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Employer'),
                leading: Radio<Accounts>(
                  value: Accounts.employer,
                  groupValue: _account,
                  onChanged: (Accounts? value) {
                    setState(() {
                      _account = value;
                      accountType = false;
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    if (accountType == true) {
                      Navigator.pushNamed(context, RouteManager.workerRegisterPage);
                    } else if(accountType == false) {
                      Navigator.pushNamed(context, RouteManager.registrationSuccessPage);
                    }                 
                  },
                  child: Text(
                    'Submit and Continue',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
