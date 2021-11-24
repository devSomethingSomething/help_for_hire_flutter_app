import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/history_model.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';

class HistoryCard extends StatelessWidget {
  final HistoryModel _history;

  const HistoryCard({
    required HistoryModel history,
  }) : _history = history;

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
            _history.description.contains('invite')
                ? Icons.insert_invitation
                : Icons.grid_view_sharp,
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
              FlatButtonWidget(
                data: 'PROFILE',
                onPressed: () {},
                primary: Colors.blue.shade900,
              ),
            ],
          ),
        ),
      ),
      shadowColor: Colors.blue[900],
    );
  }
}
