// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    Key? key,
    required String title,
    required IconData icon,
  })  : _title = title,
        _icon = icon;
  final String _title;
  final IconData _icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.blue.shade900,
      child: Column(
        children: [
          ListTile(
            title: Text(
              _title,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            leading: Icon(
              _icon,
              size: 35,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FlatButtonWidget(
                  data: 'Profile',
                  onPressed: () {},
                  primary: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                FlatButtonWidget(
                    data: 'Report',
                    onPressed: () {},
                    // =>
                    //     Navigator.popAndPushNamed(
                    //       context,
                    //       RouteManager.reportPage,
                    //    ),
                    primary: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
