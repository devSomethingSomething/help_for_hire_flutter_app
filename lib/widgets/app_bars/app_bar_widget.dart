import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
