import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/enums/status.dart';
import 'package:help_for_hire_flutter_app/models/invite_model.dart';
import 'package:help_for_hire_flutter_app/services/invite_service.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';
import 'package:provider/provider.dart';

class InviteCardWidget extends StatelessWidget {
  final InviteModel _invite;

  const InviteCardWidget({
    required InviteModel invite,
  }) : _invite = invite;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: Colors.grey[100],
        leading: const SizedBox(
          child: Placeholder(
            color: Colors.black,
          ),
          height: 48.0,
          width: 48.0,
        ),
        title: const Text(
          'John Doe',
        ),
        subtitle: Text(
          _invite.status,
        ),
        // Need to check the type of user to show the correct options here
        trailing: _invite.status.toLowerCase() !=
                Status.accepted.toString().substring('Status'.length + 1)
            ? Row(
                children: [
                  FlatButtonWidget(
                    data: 'Delete',
                    onPressed: () => context.read<InviteService>().deleteInvite(
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
  }
}
