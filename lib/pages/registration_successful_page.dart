// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bar_widget.dart';

class RegistrationSuccess extends StatefulWidget {
  const RegistrationSuccess({Key? key}) : super(key: key);

  @override
  _RegistrationSuccessState createState() => _RegistrationSuccessState();
}

class _RegistrationSuccessState extends State<RegistrationSuccess> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'Registration Successful',
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                  height: 150,
                  width: 150,
                  image: AssetImage('assets/images/Green_Check.png'),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  'You have successfully registered for Help for Hire!!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text('Sign in below in order to start using the application'),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Sign in',
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
}
