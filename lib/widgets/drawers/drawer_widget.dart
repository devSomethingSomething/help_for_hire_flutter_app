import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_page.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, RouteManager.loggedInUserProfile);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, RouteManager.settingsPage);
            },
          ),
          ListTile(
            leading: Icon(Icons.system_update),
            title: Text('Update Profile'),
            onTap: () {
              //needs to be set to current user of profile
              // Navigator.pushNamed(context, RouteManager.loggedInUserProfile);
            },
          ),
          ListTile(
            leading: Icon(Icons.reviews),
            title: Text('Review'),
            onTap: () {
              Navigator.pushNamed(context, RouteManager.reviewPage);
            },
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('Report'),
            onTap: () {
              Navigator.pushNamed(context, RouteManager.reportPage);
            },
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Invites'),
            onTap: () {
              Navigator.pushNamed(context, RouteManager.invitesPage);
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: () {
              Navigator.pushNamed(context, RouteManager.historyPage);
            },
          ),
          ListTile(
            leading: Icon(Icons.password),
            title: Text('Change Password'),
            onTap: () {
              Navigator.pushNamed(context, RouteManager.changePasswordPage);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Profile Discovery'),
            onTap: () {
              Navigator.pushNamed(context, RouteManager.profileDiscoveryPage);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SignInPage()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
