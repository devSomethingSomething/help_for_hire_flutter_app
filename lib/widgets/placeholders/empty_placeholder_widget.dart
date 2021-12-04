import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';

class EmptyPlaceholderWidget extends StatelessWidget {
  final String _data;

  const EmptyPlaceholderWidget({
    required String data,
  }) : _data = data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.warning,
            color: ColorConstants.grey,
            size: 128.0,
          ),
          const SmallSpacerWidget(),
          Text(
            _data,
            style: TextStyle(
              color: ColorConstants.grey,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
