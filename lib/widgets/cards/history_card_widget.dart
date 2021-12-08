/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/history_model.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';

/// Custom History card widget
class HistoryCard extends StatelessWidget {
  /// Variables
  final HistoryModel _history;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const HistoryCard({
    required HistoryModel history,
  }) : _history = history;

  /// Method _getIconFrom Description will display a specific
  /// icon depending on the option
  // Should add viewed
  // In the future should store by date
  // Allows us to sort by data then
  IconData _getIconFromDescription() {
    final options = {
      'invited': Icons.insert_invitation,
      'reviewed': Icons.reviews,
      'registered': Icons.app_registration,
      'reported': Icons.report,
      'updated': Icons.update,
    };

    for (var option in options.entries) {
      if (_history.description.toLowerCase().contains(option.key)) {
        return option.value;
      }
    }

    return Icons.grid_view_sharp;
  }

  /// Method _getButtonFromDescription will display a specific
  /// buttons depending on the option
  Widget _getButtonFromDescription() {
    final options = {
      'invited': FlatButtonWidget(
        data: 'VIEW',
        onPressed: () {},
        primary: Colors.orange,
      ),
      'reviewed': FlatButtonWidget(
        data: 'VIEW',
        onPressed: () {},
        primary: Colors.orange,
      ),
      'registered': Container(),
      'reported': FlatButtonWidget(
        data: 'VIEW',
        onPressed: () {},
        primary: Colors.orange,
      ),
      'updated': Container(),
    };

    for (var option in options.entries) {
      if (_history.description.toLowerCase().contains(option.key)) {
        return option.value;
      }
    }

    return Container();
  }

  /// Build the widget
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: ListTile(
          leading: Icon(
            /// Call _getIconFromDescription() method
            _getIconFromDescription(),
            color: Colors.blue[900],
            size: 32.0,
          ),
          title: Text(
            _history.description,
            style: const TextStyle(
              fontSize: 13.0,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Call _getButtonFromDescription() method
              _getButtonFromDescription(),
            ],
          ),
        ),
      ),
      shadowColor: Colors.blue[900],
    );
  }
}
