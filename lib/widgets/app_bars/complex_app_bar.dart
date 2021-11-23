import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';
import 'package:side_sheet/side_sheet.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/pages/sign_in_page.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:provider/provider.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';

class ComplexAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ComplexAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Profile'),
      backgroundColor: ColorConstants.blue,
      actions: [
        new IconButton(
          icon: new Icon(Icons.search),
          tooltip: 'Search',
          onPressed: () {
            Navigator.pushNamed(context, RouteManager.profileDiscoveryPage);
          },
        ),
        IconButton(
          onPressed: () {
            SideSheet.right(
              body: Consumer<UserService>(builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(1000, 250),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: (Colors.black),
                              offset: Offset(0, 4),
                              spreadRadius: 1,
                              blurRadius: 10,
                            )
                          ]),
                      width: MediaQuery.of(context).size.width - 24,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.account_circle_rounded,
                              color: Colors.grey,
                              size: 125,
                              //fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${value.currentUser.name} ${value.currentUser.surname}',
                            style: TextStyle(
                                fontSize: 20, color: ColorConstants.blue),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          containerButton('Profile', context, 0),
                          containerButton('Change Password', context, 1),
                          containerButton('Settings', context, 2),
                          containerButton('Report', context, 3),
                          containerButton('Review', context, 4),
                          containerButton('Invite', context, 5),
                          containerButton('Reset Password', context, 6),
                          containerButton('History', context, 7),
                          containerButton('Update Profile', context, 8),
                          containerButton('Log Out', context, 9)
                        ],
                      ),
                    ),
                  ],
                );
              }),
              context: context,
            );
          },
          icon: Icon(Icons.menu),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Container containerButton(String text, BuildContext context, item) {
  return Container(
    decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
      color: Colors.grey,
      width: 1,
    ))),
    child: InkWell(
      onTap: () {
        switch (item) {
          case 0:
            Navigator.pushNamed(context, RouteManager.loggedInUserProfile);
            break;
          case 1:
            Navigator.pushNamed(context, RouteManager.changePasswordPage);
            break;
          case 2:
            Navigator.pushNamed(context, RouteManager.settingsPage);
            break;
          case 3:
            Navigator.pushNamed(context, RouteManager.reportPage);
            break;
          case 4:
            Navigator.pushNamed(context, RouteManager.reviewPage);
            break;
          case 5:
            Navigator.pushNamed(context, RouteManager.invitesPage);
            break;
          case 6:
            Navigator.pushNamed(context, RouteManager.resetPasswordPage);
            break;
          case 7:
            Navigator.pushNamed(context, RouteManager.historyPage);
            break;
          case 8:
            Navigator.pushNamed(context, RouteManager.updateUserInfoPage);
            break;
          case 9:
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => SignInPage()),
                (route) => false);
            break;
        }
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(text),
      ),
    ),
  );
}
