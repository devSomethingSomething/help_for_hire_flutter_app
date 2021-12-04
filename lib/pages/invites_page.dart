import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/enums/status.dart';
import 'package:help_for_hire_flutter_app/extensions/string_extension.dart';
import 'package:help_for_hire_flutter_app/helpers/color_helper.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:help_for_hire_flutter_app/services/invite_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  // Card should be clickable, should be able to go to the
                  // profile of the user
                  itemBuilder: (_, index) => Card(
                    child: Padding(
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            // Perhaps the color should change depending on the
                            // invite status
                            color: ColorHelper.getRandomColor(),
                            size: 48.0,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          // Will have to change
                          context.read<UserService>().isEmployer
                              ? ChangeNotifierProvider<WorkerService>(
                                  create: (_) => WorkerService(),
                                  builder: (_, __) => Consumer<WorkerService>(
                                    builder: (_, workerService, __) {
                                      workerService.getWorker(
                                        id: service.invites[index].workerId,
                                      );

                                      context.read<UserService>().selectedUser =
                                          workerService.worker ??
                                              UserModel(
                                                userId: '',
                                                name: '',
                                                surname: '',
                                                phoneNumber: '',
                                                locationId: '',
                                              );

                                      return Text(
                                        '${workerService.worker?.name ?? 'John'} '
                                        '${workerService.worker?.surname ?? 'Doe'}',
                                      );
                                    },
                                  ),
                                )
                              : ChangeNotifierProvider<EmployerService>(
                                  create: (_) => EmployerService(),
                                  builder: (_, __) => Consumer<EmployerService>(
                                    builder: (_, employerService, __) {
                                      employerService.getEmployer(
                                        id: service.invites[index].employerId,
                                      );

                                      context.read<UserService>().selectedUser =
                                          employerService.employer ??
                                              UserModel(
                                                userId: '',
                                                name: '',
                                                surname: '',
                                                phoneNumber: '',
                                                locationId: '',
                                              );

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
                  itemCount: service.invites.length,
                ),
              ),
      ),
      drawer: const DrawerWidget(),
      drawerEnableOpenDragGesture: false,
    );
  }
}
