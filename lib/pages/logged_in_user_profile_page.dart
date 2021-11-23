// ignore_for_file: prefer_const_constructors, unnecessary_new, sized_box_for_whitespace, non_constant_identifier_names, unused_local_variable
// this is the profile of the user that has logged into the app. formerly 'employer profile' and 'worker profile'
// needs to be updated accordingly after the user service has been updated.
// needs to be updated accordingly after the location services has been updated.
// needs to be updated accordingly after the rating service has been updated.
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:provider/provider.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/pages/update_user_info_page.dart';
import 'package:help_for_hire_flutter_app/widgets/bottom_navigation.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/complex_app_bar.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';
import 'package:help_for_hire_flutter_app/classes/logged_in_user_profile_class.dart';
import 'package:help_for_hire_flutter_app/services/location_service.dart';


class LoggedInUserProfile extends StatelessWidget {
  bool isEmployer = false;
  EmployerModel? employer;
  var worker;

  @override
  Widget build(BuildContext context) {
    context.read<UserService>().currentUser;

    String txt = '';
    return Consumer3<UserService, EmployerService, WorkerService>(
        builder: (context, userService, employerService, workerService, child) {
      isEmployer = userService.currentUser is EmployerModel;
      context.read<LocationService>().getLocation(id: UserService().currentUser.locationId);
      /*if(isEmployer){
        employer=value.currentUser as EmployerModel;
      }else{
        worker=  value.currentUser as WorkerModel;
      }*/

      return Scaffold(
        //backgroundColor: Colors.grey,
        appBar: ComplexAppBar(),
        bottomNavigationBar: BottomNavigation(
          userIsEmployer: true,
          pageID: 0,
        ),
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Icon(
                              Icons.account_circle_rounded,
                              color: Colors.grey,
                              size: 200,
                              //fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      /*Positioned(
                        right: 1,
                        bottom: 1,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.black,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(

                              primary: Colors.white,
                              shadowColor: Colors.black,
                              elevation: 5,
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(2),
                            )),
                      ),*/
                    ],
                  ),
                ),
                Text(
                  '${userService.currentUser.name} ${userService.currentUser.surname}',
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                isEmployer
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(
                          top: 50,
                          left: 20,
                          right: 20,
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            height: 100,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: isEmployer
                                  ? Container()
                                  : ListView(
                                      children: [
                                        Text(
                                            '${workerService.currentUser.description}'),
                                      ],
                                    ),
                            )),
                      ),
                textWidget(
                    'phone number', '${userService.currentUser.phoneNumber}'),

                textWidget('rating', '${UserProfile().getAvgRating(userService.currentUser.userId)}'),
                Consumer<LocationService>(
                  builder: (context, value, child) {
                    return textWidget('location', '${value.location?.city} ${value.location?.province}');
                  },
                ),
                isEmployer
                    ? Container()
                    : textWidget(
                        'Working hours',
                        UserProfile().getWorkTimeString(
                            workerService.currentUser.partTime,
                            workerService.currentUser.fullTime)),
                isEmployer ? Container() : textWidget('jobs/skill', 'data'),
                // textWidget('active employments', 'data'),
                // textWidget('finished employments', 'data'),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ],
        ),
      );
    });
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
            text('$title:'),
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
        color: Colors.black,
        fontSize: 15,
      ),
    );
  }
}
// ElevatedButton(
// style: ElevatedButton.styleFrom(
// primary: Colors.white,
// elevation: 10,
// shadowColor: Colors.blue,
// ),
// onPressed: () { },
// child: Container(
// height: 40,
// width: 150,
// child: Padding(
// padding: const EdgeInsets.all(10),
// child: Text(
// 'update profile',
// textAlign: TextAlign.center,
// style: TextStyle(
// color: Colors.blue,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ),
// ),
