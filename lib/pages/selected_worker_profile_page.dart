// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/enums/status.dart';
import 'package:help_for_hire_flutter_app/models/invite_model.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/invite_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/selected_profile_widgets/card_profile_worker.dart';
import 'package:help_for_hire_flutter_app/widgets/selected_profile_widgets/image_avatar_profile.dart';
import 'package:provider/provider.dart';

class SelectedWorkerProfilePage extends StatelessWidget {
  const SelectedWorkerProfilePage();

  @override
  Widget build(BuildContext context) {
    // This is just for testing that the page works
    // Remove this later
    // The referenced worker will already have details when they get to this
    // page
    context.read<WorkerService>().worker = WorkerModel(
      description: 'Test description',
      minimumFee: 250,
      fullTime: false,
      partTime: true,
      jobIds: [
        'Gardener',
        'Cleaner',
        'Tiling',
      ],
      user: UserModel(
        userId: '1234567890123',
        name: 'Freye',
        surname: 'Archeron',
        phoneNumber: '1234567890',
        locationId: 'Bloemfontein',
      ),
      averageRating: 4,
    );

    return Scaffold(
      appBar: AppBarWidget(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.reviews,
            ),
            onPressed: () => Navigator.pushNamed(
              context,
              RouteManager.reviewPage,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.report,
            ),
            onPressed: () => Navigator.pushNamed(
              context,
              RouteManager.reportPage,
            ),
          ),
        ],
        data: '${context.read<WorkerService>().worker?.name} '
            '${context.read<WorkerService>().worker?.surname}',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    child: CardInformationWorker(),
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      top: 100.0,
                      bottom: 20.0,
                    ),
                  ),
                  Padding(
                    child: ImageAvatar(),
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 20,
                ),
                child: Card(
                  child: Container(
                    height: 450.0,
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'User Information',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 1.0,
                        ),
                        Padding(
                          child: Container(
                            child: ListView(
                              children: [
                                Padding(
                                  child: Text(
                                    '${context.read<WorkerService>().worker?.description}',
                                  ),
                                  padding: const EdgeInsets.all(
                                    8.0,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  4.0,
                                ),
                              ),
                            ),
                            height: 120.0,
                          ),
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            top: 10.0,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            textWidget(
                              'Full Time:',
                              context.read<WorkerService>().worker!.fullTime
                                  ? 'Yes'
                                  : 'No',
                            ),
                            textWidget(
                              'Part Time:',
                              context.read<WorkerService>().worker!.partTime
                                  ? 'Yes'
                                  : 'No',
                            ),
                            textWidget(
                                'Location',
                                context
                                    .read<WorkerService>()
                                    .worker!
                                    .locationId),
                          ],
                        ),
                      ],
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.darkBlue,
        child: const Icon(
          Icons.post_add,
        ),
        // This should check for duplicates first
        // Will require change to web api
        // Should also show a box to let the user know what they are doing
        onPressed: () => context.read<InviteService>().postInvite(
              invite: InviteModel(
                // Gets generated, no need to pass anything
                inviteId: '',
                // Should start out as pending
                status: Status.pending.toString(),
                // Get the id of the current user, only an employer can access
                // this page, meaning that the current user must be an employer
                employerId: context.read<UserService>().currentUser.userId,
                // Same reference used in other places on this page
                workerId: context.read<WorkerService>().worker?.userId ?? '',
              ),
            ),
      ),
    );
  }

  Padding textWidget(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 55,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            text(title),
            text(content),
          ],
        ),
      ),
    );
  }

  Text text(String txt) {
    return Text(
      txt,
      style: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
