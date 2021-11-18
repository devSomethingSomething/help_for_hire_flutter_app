// ignore_for_file: prefer_const_constructors, avoid_init_to_null

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';

class AccountTypePage extends StatefulWidget {
  const AccountTypePage({Key? key}) : super(key: key);

  @override
  _AccountTypePageState createState() => _AccountTypePageState();
}

class _AccountTypePageState extends State<AccountTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        data: 'Account type',
      ),
      body: Center(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'please choose your account type:',
                    style: TextStyle(fontSize: 20),
                  ),
                )),
            Expanded(
              flex: 6,
              child: AccountTypeCard(
                text: 'worker',
                color: Colors.white,
                isEmployer: false,
                image: ImageConstants.worker,
              ),
            ),
            Expanded(
              flex: 6,
              child: AccountTypeCard(
                text: 'employer',
                color: Colors.white,
                isEmployer: true,
                image: ImageConstants.employer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountTypeCard extends StatelessWidget {
  final text;
  final color;
  final isEmployer;
  final image;
  const AccountTypeCard({
    Key? key,
    required this.text,
    required this.color,
    required this.isEmployer,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Container(
        //can add pictures of the relevant account
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: InkWell(
          onTap: () {
            if (isEmployer) {
              Navigator.of(context).pushNamed(RouteManager.workerRegisterPage);
            } else {
              Navigator.of(context).pushNamed(RouteManager.workerRegisterPage);
            }
          },
          child: Center(
              child: Row(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(image),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 40,
                  //color: Colors.white,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
