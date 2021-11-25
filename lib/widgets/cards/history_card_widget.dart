import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/history_model.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';

class HistoryCard extends StatelessWidget {
  final HistoryModel _history;

  const HistoryCard({
    required HistoryModel history,
  }) : _history = history;

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
              _getButtonFromDescription(),
            ],
          ),
        ),
      ),
      shadowColor: Colors.blue[900],
    );
  }
}
