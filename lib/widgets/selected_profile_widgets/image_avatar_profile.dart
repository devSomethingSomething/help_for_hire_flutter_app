import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';

class ImageAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CircleAvatar(
        backgroundColor: ColorConstants.blue,
        child: const CircleAvatar(
          backgroundImage: AssetImage(
            ImageConstants.placeholder,
          ),
          radius: 70,
        ),
        radius: 75,
      ),
    );
  }
}
