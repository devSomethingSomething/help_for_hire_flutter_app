// ignore_for_file: prefer_const_constructors, implementation_imports, unused_import, prefer_const_literals_to_create_immutables
/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:provider/src/provider.dart';

/// Custom Card information employer widget
class CardInformationEmployer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<EmployerService>().getEmployers();
    return Card(
      child: Container(
        height: 200,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: <Widget>[
              /// Display the employer name and surname
              Text(
                '${context.read<EmployerService>().employer?.name} '
                '${context.read<EmployerService>().employer?.surname}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  right: 25,
                  left: 25,
                  bottom: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [RowName()],
                ),
              ),
            ],
          ),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

/// Custom Row name widget
class RowName extends StatelessWidget {
  /// Build the widget
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          //Replace with company name
          //'${context.read<EmployerService>().employer?.companyName}',
          'Company Name',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
