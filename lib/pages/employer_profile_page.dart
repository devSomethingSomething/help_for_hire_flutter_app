import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:provider/provider.dart';
import 'package:side_sheet/side_sheet.dart';

class EmployerProfile extends StatelessWidget {
  const EmployerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  return DrawerWidget();
                }),
                context: context,
              );
            },
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage(ImageConstants.placeholder),
                      radius: 80,
                    ),
                  ),
                  Text(
                    'Freye Archeron',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            textWidget(
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('Name'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    )),
                'Freye'),
            textWidget(
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('Surname'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    )),
                'Archeron'),
            textWidget(
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('Location'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    )),
                'Free State'),
            textWidget(
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('Phone Number'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    )),
                '0833850667'),
            textWidget(
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('ID Number'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    )),
                '9903310258001'),
            textWidget(
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    label: Text('Description'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    )),
                'I am 32 years old'),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Padding textWidget(TextButton txtBtn, String content) {
  return Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Container(
      height: 55,
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          txtBtn,
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
        color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
  );
}