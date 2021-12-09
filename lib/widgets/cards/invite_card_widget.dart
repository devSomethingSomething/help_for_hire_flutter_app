/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/enums/status.dart';
import 'package:help_for_hire_flutter_app/models/invite_model.dart';
import 'package:help_for_hire_flutter_app/services/invite_service.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';
import 'package:provider/provider.dart';

/// Custom Invite card widget
class InviteCardWidget extends StatelessWidget {
  /// Variables
  final InviteModel _invite;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const InviteCardWidget({
    required InviteModel invite,
  }) : _invite = invite;

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    // Will need to do a check here to get the correct info from the correct
    // user service
    context.read<WorkerService>().getWorker(
          id: _invite.workerId,
        );
    return Consumer<WorkerService>(
      builder: (context, value, child) {
        // First check if the map length is zero and there is no error
        return value.workers.isEmpty
            ? const CircularProgressIndicator()
            : Card(
                child: ListTile(
                  tileColor: Colors.grey[100],
                  leading: const SizedBox(
                    child: Placeholder(
                      color: Colors.black,
                    ),
                    height: 48.0,
                    width: 48.0,
                  ),
                  // Need to do a user type check here
                  title: const Text(
                    'John Doe',
                  ),
                  subtitle: Text(
                    _invite.status,
                  ),
                  // Need to check the type of user to show the correct options here
                  trailing: _invite.status.toLowerCase() !=
                          Status.accepted
                              .toString()
                              .substring('Status'.length + 1)
                      ? Row(
                          children: [
                            FlatButtonWidget(
                              data: 'Delete',
                              onPressed: () =>
                                  context.read<InviteService>().deleteInvite(
                                        id: _invite.inviteId,
                                      ),
                              primary: Colors.red,
                            ),
                          ],
                          mainAxisSize: MainAxisSize.min,
                        )
                      : Row(
                          children: [
                            FlatButtonWidget(
                              data: 'Contact',
                              onPressed: () {},
                              primary: Colors.green,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            FlatButtonWidget(
                              data: 'Delete',
                              onPressed: () {},
                              primary: Colors.red,
                            ),
                          ],
                          mainAxisSize: MainAxisSize.min,
                        ),
                ),
                elevation: 4.0,
              );
      },
    );
  }
}
