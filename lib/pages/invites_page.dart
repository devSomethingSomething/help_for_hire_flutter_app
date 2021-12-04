import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/services/invite_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/cards/invite_card_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:provider/provider.dart';

class InvitesPage extends StatelessWidget {
  const InvitesPage();

  /// Get the invites for the current user based on their account type
  void _getInvitesForUser({
    required BuildContext context,
  }) =>
      context.read<UserService>().isEmployer
          ? context.read<InviteService>().getInvitesForEmployer(
                employerId: context.read<UserService>().currentUser.userId,
              )
          : context.read<InviteService>().getInvitesForWorker(
                id: context.read<UserService>().currentUser.userId,
              );

  @override
  Widget build(BuildContext context) {
    // ---------------------------
    // Remove later
    // Add test data for the current user here
    // ---------------------------
    context.read<UserService>().currentUser = EmployerModel(
      user: UserModel(
        userId: '1234567890123',
        name: 'Kaden',
        surname: 'Shaw',
        phoneNumber: '1234567890',
        locationId: '123',
      ),
    );

    // Gets the invites for the current user
    _getInvitesForUser(
      context: context,
    );

    return Scaffold(
      appBar: AppBarWidget(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
            ),
            onPressed: () => _getInvitesForUser(
              context: context,
            ),
          ),
        ],
        data: 'Invites',
      ),
      body: Consumer<InviteService>(
        builder: (_, service, __) => service.invites.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: ColorConstants.blue,
                ),
              )
            : Center(
                child: ListView.builder(
                  itemBuilder: (_, index) => InviteCardWidget(
                    invite: service.invites[index],
                  ),
                  itemCount: service.invites.length,
                ),
              ),
      ),
      drawer: const DrawerWidget(),
      drawerEnableOpenDragGesture: false,
    );
  }
}
