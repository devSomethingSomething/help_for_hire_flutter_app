// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
//need to up load
  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController userPasswordController = TextEditingController();
    return Scaffold(
      body: Container(
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Log In',
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 50,
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: userNameController,
                decoration: InputDecoration(hintText: 'User Name'),
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: userPasswordController,
                decoration: InputDecoration(hintText: 'Password'),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                        EdgeInsets.only(left: 35, right: 35),
                      )),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, RouteManager.registerPage);
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                        EdgeInsets.only(left: 20, right: 20),
                      )),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, RouteManager.resetPasswordPage);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
              //ContactMethodWidget(),
            ],
          ),
        )),
      ),
    );
  }
}
