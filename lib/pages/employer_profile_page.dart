import 'package:flutter/material.dart';

class EmpProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String txt = '';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: Text(
            'Profile',
          ),
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
        ),
        drawer: openDrawer(),
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

  Drawer openDrawer() {
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
              // Navigator.pushNamed(context, RouteManager.historyPage);
            },
          ),
          ListTile(
            title: text('Review'),
            onTap: () {
              // Navigator.pushNamed(context, RouteManager.reviewPage);
            },
          ),
          ListTile(
            title: text('Report'),
            onTap: () {
              // Navigator.pushNamed(context, RouteManager.reportPage);
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
}
