/// Imports
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/enums/status.dart';
import 'package:help_for_hire_flutter_app/extensions/string_extension.dart';
import 'package:help_for_hire_flutter_app/helpers/delay_helper.dart';
import 'package:help_for_hire_flutter_app/helpers/info_helper.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:help_for_hire_flutter_app/services/invite_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/placeholders/empty_placeholder_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// This pages shows all the invites for the user
/// An employer can view any active invites they sent.
/// A worker can view any job invites sent from employers
class InvitesPage extends StatelessWidget {
  /// Constructor
  const InvitesPage();

  /// Get the invites for the current user based on their account type
  Future<void> _getInvitesForUser({
    required BuildContext context,
  }) async =>
      context.read<UserService>().isEmployer
          ? await context.read<InviteService>().getInvitesForEmployer(
                employerId: context.read<UserService>().currentUser.userId,
              )
          : await context.read<InviteService>().getInvitesForWorker(
                id: context.read<UserService>().currentUser.userId,
              );

  /// Builds the widget
  @override
  Widget build(BuildContext context) {
    // ---------------------------
    // Remove later
    // Add test data for the current user here
    // ---------------------------
    // context.read<UserService>().currentUser = EmployerModel(
    //   user: UserModel(
    //     userId: '1234567890123',
    //     name: 'Kaden',
    //     surname: 'Shaw',
    //     phoneNumber: '1234567890',
    //     locationId: '123',
    //   ),
    // );
    // ---------------------------

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

            /// When this button is pressed it will reload the page and
            /// listen if their is any updates to the history
            onPressed: () async {
              DelayHelper.showLoadingIndicator(context: context);

              await _getInvitesForUser(
                context: context,
              );

              DelayHelper.hideLoadingIndicator(context: context);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.info_outline_rounded,
            ),

            /// Dialog that displays what the page is for
            onPressed: () => InfoHelper.showInfoDialog(
              context: context,
              content: 'This page allows you to view invites',
              title: 'Invites Details',
            ),
          ),
        ],
        data: 'Invites',
      ),
      body: Consumer<InviteService>(
        // First check if the map length is zero and there is no error
        builder: (_, service, __) => service.invites.isEmpty
            ? const EmptyPlaceholderWidget(
                /// Return text if their is no data
                data: 'No invites to display',
              )
            : Center(
                /// Show the Invites when the data has been loaded
                child: ListView.builder(
                  itemBuilder: (_, index) => GestureDetector(
                    child: Card(
                      child: Padding(
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,

                              /// Displays the status of the invite
                              color: service.invites[index].status ==
                                      Status.pending
                                          .toString()
                                          .replaceAll('Status.', '')
                                          .capitalize()
                                  ? Colors.blue[200]
                                  : Colors.blue,
                              size: 40.0,
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            context.read<UserService>().isEmployer
                                ? ChangeNotifierProvider<WorkerService>(
                                    create: (_) => WorkerService(),
                                    builder: (_, __) => Consumer<WorkerService>(
                                      builder: (_, workerService, __) {
                                        workerService.getWorker(
                                          id: service.invites[index].workerId,
                                        );

                                        context
                                                .read<UserService>()
                                                .selectedUser =
                                            workerService.worker ??
                                                UserModel.empty();

                                        return Text(
                                          '${workerService.worker?.name ?? 'John'} '
                                          '${workerService.worker?.surname ?? 'Doe'}',
                                        );
                                      },
                                    ),
                                  )
                                : ChangeNotifierProvider<EmployerService>(
                                    create: (_) => EmployerService(),
                                    builder: (_, __) =>
                                        Consumer<EmployerService>(
                                      builder: (_, employerService, __) {
                                        employerService.getEmployer(
                                          id: service.invites[index].employerId,
                                        );

                                        context
                                                .read<UserService>()
                                                .selectedUser =
                                            employerService.employer ??
                                                UserModel.empty();

                                        return Text(
                                          '${employerService.employer?.name ?? 'John'} '
                                          '${employerService.employer?.surname ?? 'Doe'}',
                                        );
                                      },
                                    ),
                                  ),
                            const Spacer(),
                            context.read<UserService>().isEmployer
                                ? service.invites[index].status ==
                                        Status.accepted
                                            .toString()
                                            .replaceAll('Status.', '')
                                            .capitalize()
                                    ? FlatButtonWidget(
                                        data: 'CONTACT',

                                        /// If the invite was accepted the user
                                        /// can choose to contact and the phone
                                        /// with the number will be displayed
                                        onPressed: () => launch(
                                          'tel://${context.read<UserService>().selectedUser.phoneNumber}',
                                        ),
                                        primary: Colors.green,
                                      )
                                    : Text(
                                        service.invites[index].status,
                                      )
                                : service.invites[index].status ==
                                        Status.accepted
                                            .toString()
                                            .replaceAll('Status.', '')
                                            .capitalize()
                                    ? Text(
                                        service.invites[index].status,
                                      )
                                    : FlatButtonWidget(
                                        data: 'ACCEPT',
                                        onPressed: () {
                                          service.invites[index].status = Status
                                              .accepted
                                              .toString()
                                              .replaceAll('Status.', '')
                                              .capitalize();

                                          service.putInvite(
                                            id: service.invites[index].inviteId,
                                            invite: service.invites[index],
                                          );
                                        },
                                        primary: Colors.green,
                                      ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            FlatButtonWidget(
                              data: 'DELETE',
                              onPressed: () => service.deleteInvite(
                                id: service.invites[index].inviteId,
                              ),
                              primary: Colors.red,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(
                          8.0,
                        ),
                      ),
                      elevation: 4.0,
                    ),
                    onTap: () => Navigator.pushNamed(
                      context,
                      context.read<UserService>().isEmployer
                          ? RouteManager.selectedEmployerProfilePage
                          : RouteManager.selectedWorkerProfilePage,
                    ),
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
