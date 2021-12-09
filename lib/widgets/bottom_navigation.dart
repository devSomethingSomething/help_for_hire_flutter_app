// ignore_for_file: prefer_typing_uninitialized_variables
/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';

/// Custom Bottom navigation
class BottomNavigation extends StatefulWidget {
  /// Variables
  final int pageID;
  final userIsEmployer;

  /// Constructor with required fields
  const BottomNavigation({
    Key? key,
    required this.userIsEmployer,
    required this.pageID,
  }) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  /// Variables
  var selectedIndex;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    selectedIndex = widget.pageID;

    return BottomNavigationBar(
      backgroundColor: ColorConstants.darkBlue,
      selectedItemColor: Colors.lightGreenAccent,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      currentIndex: selectedIndex,
      onTap: _onItemTaped,
      items: const [
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

  /// Method _onItemTap will navigate to the corresponding page of the index
  void _onItemTaped(int index) {
    setState(() {
      selectedIndex = index;
    });

    switch (index) {
      case 0:

        /// Navigates to the Logged in user profile Page
        Navigator.pushNamed(context, RouteManager.loggedInUserProfile);
        break;
      case 1:

        /// Navigates to the Invites Page
        //Navigator.pushNamed(context, RouteManager.invitesPage);
        break;
      case 2:

        /// Navigates to the History Page
        Navigator.pushNamed(context, RouteManager.historyPage);
        break;
    }
  }
}
