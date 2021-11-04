// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bar_widget.dart';

enum Accounts { worker, employer }

class AccountType extends StatefulWidget {
  const AccountType({Key? key}) : super(key: key);

  @override
  _AccountTypeState createState() => _AccountTypeState();
}

class _AccountTypeState extends State<AccountType> {
  Accounts? _account = Accounts.employer;

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
                    });
                  },
                  activeColor: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {},
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
