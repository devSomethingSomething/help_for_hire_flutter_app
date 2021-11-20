import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';

class BottomNavigation extends StatefulWidget {
  final userIsEmployer;
  const BottomNavigation({Key? key, required this.userIsEmployer})
      : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: ColorConstants.blue,
      selectedItemColor: Colors.lightGreenAccent,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: selectedIndex,
      onTap: _onItemTaped,
      items: [
        BottomNavigationBarItem(
          //backgroundColor: ColorConstants.blue,
          icon: Icon(Icons.account_circle_rounded),
          label: 'profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.outgoing_mail),
          label: 'invites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'history',
        ),
      ],
    );
  }

  void _onItemTaped(int index) {
    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, RouteManager.loggedInUserProfile);
        break;
      case 1:
        //Navigator.pushNamed(context, RouteManager.invitesPage);
        break;
      case 2:
        Navigator.pushNamed(context, RouteManager.historyPage);
        break;
    }
  }
}
