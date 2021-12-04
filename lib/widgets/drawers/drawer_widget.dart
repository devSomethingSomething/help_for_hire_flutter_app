import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.person,
            ),
            title: const Text(
              'Profile',
            ),
            onTap: () {
              if (context.read<UserService>().isEmployer) {
                Navigator.popAndPushNamed(
                  context,
                  RouteManager.employerProfilePage,
                );
              } else {
                Navigator.popAndPushNamed(
                  context,
                  RouteManager.workerProfilePage,
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.email,
            ),
            title: const Text(
              'Invites',
            ),
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                RouteManager.invitesPage,
              );
            },
          ),
          context.read<UserService>().isEmployer
              ? ListTile(
                  leading: const Icon(
                    Icons.list,
                  ),
                  title: const Text(
                    'Profile Discovery',
                  ),
                  onTap: () {
                    Navigator.popAndPushNamed(
                      context,
                      RouteManager.profileDiscoveryPage,
                    );
                  },
                )
              : Container(),
          ListTile(
            leading: const Icon(
              Icons.history,
            ),
            title: const Text(
              'History',
            ),
            onTap: () {
              Navigator.popAndPushNamed(
                context,
                RouteManager.historyPage,
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text(
              'Settings',
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteManager.settingsPage,
              );
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
            ),
            title: const Text(
              'Logout',
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteManager.signInPage,
                (_) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
