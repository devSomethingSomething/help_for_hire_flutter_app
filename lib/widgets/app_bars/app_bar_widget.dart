import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String _title;

  const AppBarWidget({
    required String title,
  }) : _title = title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.blue,
      title: Text(
        _title,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
