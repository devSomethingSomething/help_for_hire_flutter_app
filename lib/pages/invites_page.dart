import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/services/invite_service.dart';
import 'package:help_for_hire_flutter_app/widgets/cards/invite_card_widget.dart';
import 'package:provider/provider.dart';

class InvitesPage extends StatelessWidget {
  const InvitesPage();

  @override
  Widget build(BuildContext context) {
    // Need to call the correct method based on the type of the current user
    // who is signed in
    // Update here
    context.read<InviteService>().getInvitesForEmployer(
          id: '0002245275082',
        );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              size: 28.0,
            ),
            // Needs to get the invites again when clicked
            onPressed: () =>
                // Need to call the correct method based on user type
                context.read<InviteService>().getInvitesForEmployer(
                      id: '0002245275082',
                    ),
            splashRadius: 28.0,
          ),
        ],
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Invites',
        ),
      ),
      body: Center(
        child: Consumer<InviteService>(
          builder: (_, inviteService, __) {
            return inviteService.invites.isEmpty
                ? CircularProgressIndicator(
                    color: Colors.blue[900],
                  )
                : ListView.builder(
                    itemCount: inviteService.invites.length,
                    itemBuilder: (_, index) {
                      return InviteCardWidget(
                        invite: inviteService.invites[index],
                      );
                    },
                  );
          },
        ),
      ),
      // Needs to be the same between pages
      drawer: const Drawer(),
      drawerEnableOpenDragGesture: false,
    );
  }
}
