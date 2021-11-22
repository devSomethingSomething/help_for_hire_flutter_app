import 'package:flutter/material.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_page.dart';

class ComplexAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ComplexAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Profile'),
      backgroundColor: ColorConstants.blue,
      actions: [
        new IconButton(
          icon: new Icon(Icons.search),
          tooltip: 'Search',
          onPressed: () {
            Navigator.pushNamed(context, RouteManager.profileDiscoveryPage);
          },
        ),
        PopupMenuButton(
          icon: Icon(Icons.menu),
          color: ColorConstants.blue,
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
            ),
            PopupMenuItem<int>(
              value: 4,
              child: Text(
                'Change Password',
                style: TextStyle(color: Colors.white),
              ),
            ),
            PopupMenuItem<int>(
              value: 5,
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
          onSelected: (item) => SelectedItem(context, item),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

void SelectedItem(BuildContext context, item) {
  switch (item) {
    case 0:
      Navigator.pushNamed(context, RouteManager.settingsPage);
      break;
    case 1:
      Navigator.pushNamed(context, RouteManager.changePasswordPage);
      break;
    case 2:
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => SignInPage()),
              (route) => false);
      break;
  }
}
