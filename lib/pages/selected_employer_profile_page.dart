// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/selected_profile_widgets/card_profile_employer.dart';
import 'package:help_for_hire_flutter_app/widgets/selected_profile_widgets/card_profile_worker.dart';
import 'package:help_for_hire_flutter_app/widgets/selected_profile_widgets/image_avatar_profile.dart';
import 'package:provider/src/provider.dart';

class SelectedEmployerProfilePage extends StatelessWidget {
  //final EmployerModel employer;
  // const SelectedEmployerProfilePage({Key? key, required this.employer})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<EmployerService>().getEmployers();
    return Scaffold(
      appBar: AppBarWidget(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.reviews,
            ),
            onPressed: () {
              Navigator.pushNamed(context, RouteManager.reviewPage);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.report,
            ),
            onPressed: () {
              Navigator.pushNamed(context, RouteManager.reportPage);
            },
          ),
        ],
        data: '${context.read<EmployerService>().employer?.name} '
            '${context.read<EmployerService>().employer?.surname}',
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 100, left: 10, right: 10, bottom: 20),
                    child: CardInformationEmployer(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ImageAvatar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 320, left: 10, right: 10, bottom: 20),
                    child: Card(
                      child: Container(
                        height: 220,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'User Information',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                              thickness: 1.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                textWidget('Location: ',
                                    '${context.read<EmployerService>().employer?.locationId}'),
                                // This will be added ones the Employer model is updated
                                // textWidget('Address', ''),
                                // textWidget('Suburb', ''),
                                textWidget('Contact Number: ',
                                    '${context.read<EmployerService>().employer?.phoneNumber}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      shadowColor: Colors.black,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ],
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
        onPressed: () {},
      ),
    );
  }

  Padding textWidget(String title, String content) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
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
      style: TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
