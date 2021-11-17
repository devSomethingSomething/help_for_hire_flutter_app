import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';

class SelectedEmployerPage extends StatelessWidget {
  final EmployerModel employer;
  const SelectedEmployerPage({Key? key, required this.employer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  '${employer.name} ${employer.surname}',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Rate user',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {},
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
                style: TextStyle(
                  fontSize: 20,
                ),
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
                width: 150,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'View this users History',
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
