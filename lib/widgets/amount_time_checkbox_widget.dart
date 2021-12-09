/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';

/// Custom check box for the full and part time selection in
/// the worker registration
class AmountTimeCheckBox extends StatelessWidget {
  /// Variables
  final bool _time;
  final String _data;
  final void Function(bool?) _onChanged;
  final Color _color;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const AmountTimeCheckBox({
    required bool time,
    required String data,
    required Color color,
    required void Function(bool?) onChanged,
  })  : _time = time,
        _data = data,
        _color = color,
        _onChanged = onChanged;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: CheckboxListTile(
        activeColor: Colors.white,
        checkColor: ColorConstants.darkBlue,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          _data,
          style: TextStyle(
            color: _color,
          ),
        ),
        onChanged: _onChanged,
        value: _time,
      ),
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: _color,
      ),
    );
  }
}
