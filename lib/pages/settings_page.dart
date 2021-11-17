// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/theme_data.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        data: 'Settings',
      ),
      body: Consumer<ThemeSettings>(
        builder: (context, value, child) {
          return SettingsList(
            sections: [
              SettingsSection(
                titlePadding: EdgeInsets.all(20),
                title: 'Section 1',
                tiles: [
                  SettingsTile(
                    title: 'Language',
                    subtitle: 'English',
                    leading: Icon(Icons.language),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile.switchTile(
                    title: 'Dark Theme',
                    leading: Icon(Icons.dark_mode),
                    switchValue: value.darkTheme,
                    onToggle: (newValue) {
                      value.toggleTheme();
                    },
                  ),
                ],
              ),
              SettingsSection(
                titlePadding: EdgeInsets.all(20),
                title: 'Section 2',
                tiles: [
                  SettingsTile(
                    title: 'About',
                    subtitle: 'Read information about this app',
                    leading: Icon(Icons.info),
                    onPressed: (BuildContext context) {},
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
