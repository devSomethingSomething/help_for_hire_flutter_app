// ignore_for_file: prefer_const_constructors, unnecessary_new, sized_box_for_whitespace, non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/login_page.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/widgets/app_bars/app_bar_widget.dart';

class EmpProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String txt = '';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Profile'),
          actions: [
            new IconButton(
                icon: new Icon(Icons.search),
                tooltip: 'Search',
                onPressed: () {}),
            PopupMenuButton(
              icon: Icon(Icons.menu),
              color: Colors.blue,
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    'Settings',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    'History',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text(
                    'Review',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text(
                    'Report',
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
        body: SingleChildScrollView(
          child: Column(
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
                        radius: 70,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/default.jpg',
                            height: 150,
                            width: 150,
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
                            primary: Colors.blue,
                            shadowColor: Colors.black,
                            elevation: 5,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(2),
                          )),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: _container('Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: _container('ID Number'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        _container('Email'),
                        _row(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        _container('Phone Number'),
                        _row(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        _container('Province'),
                        _row(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Stack(
                      children: [
                        _container('City'),
                        _row(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 10,
                        shadowColor: Colors.blue,
                      ),
                      onPressed: () {},
                      child: Container(
                        height: 40,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Change Password',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      border: Border.all(
        width: 2.0,
        color: Colors.black,
      ),
    );
  }

  Container _container(String txt) {
    return Container(
      height: 60,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          txt,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: _boxDecoration(),
    );
  }

  Row _row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
          child: ElevatedButton(
            child: Icon(
              Icons.edit,
              color: Colors.blue,
            ),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              primary: Colors.white,
              shadowColor: Colors.blue,
              elevation: 5,
            ),
          ),
        ),
      ],
    );
  }

  Drawer openDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                'Profile Settings',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ListTile(
            title: text('Settings'),
            onTap: () {
              // Navigator.pushNamed(context, RouteManager.settingsPage);
            },
          ),
          ListTile(
            title: text('History'),
            onTap: () {
              Navigator.pushNamed(context, RouteManager.historyPage);
            },
          ),
          ListTile(
            title: text('Review'),
            onTap: () {
              Navigator.pushNamed(context, RouteManager.reviewPage);
            },
          ),
          ListTile(
            title: text('Report'),
            onTap: () {
              Navigator.pushNamed(context, RouteManager.reportPage);
            },
          ),
        ],
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
        Navigator.pushNamed(context, RouteManager.historyPage);
        break;
      case 2:
        Navigator.pushNamed(context, RouteManager.reviewPage);
        break;
      case 3:
        Navigator.pushNamed(context, RouteManager.reportPage);
        break;
      case 4:
        Navigator.pushNamed(context, RouteManager.changePasswordPage);
        break;
      case 5:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
        break;
    }
  }
}
