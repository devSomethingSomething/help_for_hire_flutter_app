/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/widgets/spacers/small_spacer_widget.dart';

/// Empty placeholder widget
class EmptyPlaceholderWidget extends StatelessWidget {
  /// Variables
  final String _data;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const EmptyPlaceholderWidget({
    required String data,
  }) : _data = data;

  /// Builds the widget
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
