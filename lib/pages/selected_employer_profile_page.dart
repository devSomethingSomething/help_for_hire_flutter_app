import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/flat_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/selected_profile_widgets/card_profile_employer.dart';
import 'package:help_for_hire_flutter_app/widgets/selected_profile_widgets/card_profile_worker.dart';
import 'package:help_for_hire_flutter_app/widgets/selected_profile_widgets/image_avatar_profile.dart';

class SelectedEmployerProfilePage extends StatelessWidget {
  //final EmployerModel employer;
  // const SelectedEmployerProfilePage({Key? key, required this.employer})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBarWidget(
        data: 'Profile',
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
                        height: 340,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                'Company Information',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Description',
                                        //'${worker?.description}',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                textWidget('Location: ', ''),
                                textWidget('Contact Number: ', ''),
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
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteManager.reviewPage);
                      },
                      primary: ColorConstants.blue,
                      data: 'Rate Company',
                    ),
                    FlatButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteManager.historyPage);
                      },
                      primary: ColorConstants.blue,
                      data: 'View History',
                    ),
                    FlatButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteManager.reportPage);
                      },
                      primary: ColorConstants.blue,
                      data: 'Report Company',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
            text('$content'),
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

