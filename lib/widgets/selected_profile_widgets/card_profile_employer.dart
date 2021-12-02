import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';

class CardInformationEmployer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: <Widget>[
              Text(
                'Nesta Archeron',
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
                  children: [
                   RowName()
                  ],
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

class RowName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          //Replace with company name
          'Company: ',
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