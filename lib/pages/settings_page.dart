/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/settings_model.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

/// This page handles the settings within the app
class SettingsPage extends StatelessWidget {
  /// Constructor
  const SettingsPage();

  /// Builds our widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        data: 'Settings',
      ),
      // The consumer ensures that our page rebuilds when the settings model
      // updates
      body: Consumer<SettingsModel>(
        builder: (_, model, __) {
          return SettingsList(
            sections: [
              SettingsSection(
                tiles: [
                  // Allows the user to set their language
                  SettingsTile(
                    leading: const Icon(
                      Icons.language,
                    ),
                    onPressed: (_) {},
                    subtitle: 'English',
                    title: 'Language',
                  ),
                  // Allows the user to switch themes
                  SettingsTile.switchTile(
                    leading: const Icon(
                      Icons.dark_mode,
                    ),
                    onToggle: (_) => model.toggleTheme(),
                    switchValue: model.darkTheme,
                    title: 'Dark Theme',
                  ),
                ],
                title: 'App',
                titlePadding: const EdgeInsets.all(
                  16.0,
                ),
              ),
              SettingsSection(
                tiles: [
                  // Should display more info about the app
                  SettingsTile(
                    leading: const Icon(
                      Icons.info,
                    ),
                    onPressed: (_) {},
                    subtitle: 'Read information about this app',
                    title: 'About',
                  ),
                ],
                title: 'Other',
                titlePadding: const EdgeInsets.all(
                  16.0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
