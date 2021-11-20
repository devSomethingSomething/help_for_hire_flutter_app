// ignore_for_file: prefer_const_constructors, unnecessary_new, sized_box_for_whitespace, non_constant_identifier_names, unused_local_variable
// this is the profile of the user that has logged into the app. formerly 'employer profile' and 'worker profile'
// needs to be updated accordingly after the user service has been updated.
import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/employer_info_page.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/pages/update_user_info_page.dart';
import 'package:help_for_hire_flutter_app/widgets/bottom_navigation.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_page.dart';

class LoggedInUserProfile extends StatelessWidget {
  bool isEmployer = false;
  @override
  Widget build(BuildContext context) {
    String txt = '';
    return Consumer<UserService>(builder: (context, value, child) {
      //isEmployer=value.isEmployer;
      return Scaffold(
        //backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Profile'),
          actions: [
            new IconButton(
              icon: new Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () {
                Navigator.pushNamed(context, RouteManager.profileDiscoveryPage);
              },
            ),
            PopupMenuButton(
              icon: Icon(Icons.menu),
              color: ColorConstants.blue,
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 4,
                  child: Text(
                    'Change Password',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 5,
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              onSelected: (item) => SelectedItem(context, item),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          userIsEmployer: true,
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
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 100,
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/default.jpg',
                              height: 200,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 1,
                        bottom: 1,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Container(
                              height: 40,
                              width: 40,
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: ColorConstants.blue,
                              shadowColor: Colors.black,
                              elevation: 5,
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(2),
                            )),
                      ),
                    ],
                  ),
                ),
                Text(
                  'name surname',
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
                              child: ListView(
                                children: [
                                  Text('description'),
                                ],
                              ),
                            )),
                      ),
                textWidget('phone number', 'data'),
                textWidget('rating', 'data'),
                textWidget('location', 'data'),
                isEmployer ? Container() : textWidget('jobs/skill', 'data'),
                textWidget('active employments', 'data'),
                textWidget('finished employments', 'data'),
                Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 10),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(color: ColorConstants.blue),
                        ),
                        child: Center(
                          child: Text(
                            'Update Profile',
                            style: TextStyle(
                              color: ColorConstants.blue,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    )),
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

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.pushNamed(context, RouteManager.settingsPage);
        break;
      case 1:
        Navigator.pushNamed(context, RouteManager.changePasswordPage);
        break;
      case 2:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SignInPage()),
            (route) => false);
        break;
    }
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
