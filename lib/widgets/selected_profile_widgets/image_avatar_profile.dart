import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';
//Contains the Circle Avatar
class ImageAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorConstants.blue,
          
        ),
      ),
      child: CircleAvatar(
        radius: 75,
        backgroundImage: AssetImage('assets/images/placeholder.jpg'),
      ),
    );
  }
}
