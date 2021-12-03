import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';

/// Custom app bar
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  /// Title of the app bar
  final String _data;

  const AppBarWidget({
    required String data,
  }) : _data = data;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.blue,
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
