/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';

/// Custom app bar
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  /// Varaibles
  /// Title of the app bar
  final String _data;

  /// List of optional actions
  final List<Widget> _actions;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const AppBarWidget({
    required String data,
    List<Widget> actions = const [],
  })  : _data = data,
        _actions = actions;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: _actions,
      backgroundColor: ColorConstants.darkBlue,
      title: Text(
        _data,
      ),
    );
  }

  /// Required method for implementing a custom app bar
  ///
  /// Ensures that the app bar is the correct size
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
