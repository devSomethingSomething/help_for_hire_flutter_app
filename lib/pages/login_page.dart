// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/text_form_fields/text_form_field_widget.dart';
import 'package:help_for_hire_flutter_app/helpers/validation_helper.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

//need to up load
  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    TextEditingController userNameController = TextEditingController();
    TextEditingController userPasswordController = TextEditingController();
    return Scaffold(
      body: Container(
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _key,
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
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: userPasswordController,
                  decoration: InputDecoration(hintText: 'Password'),
                  style: TextStyle(fontSize: 20),
                  validator: ValidationHelper.validatePassword,
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
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            return;
                          } else {
                            //continue to next page
                          }
                        },
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
          ),
        )),
      ),
    );
  }
}
