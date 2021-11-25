import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/constants/image_constants.dart';
import 'package:help_for_hire_flutter_app/routes/route_manager.dart';
import 'package:help_for_hire_flutter_app/services/user_service.dart';
import 'package:help_for_hire_flutter_app/widgets/drawers/drawer_widget.dart';
import 'package:provider/provider.dart';
import 'package:side_sheet/side_sheet.dart';

class EmployerProfilePage extends StatelessWidget {
  const EmployerProfilePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
        ),
        backgroundColor: ColorConstants.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouteManager.profileDiscoveryPage,
              );
            },
          ),
          IconButton(
            onPressed: () {
              SideSheet.right(
                body: Consumer<UserService>(
                  builder: (context, value, child) {
                    return const DrawerWidget();
                  },
                ),
                context: context,
              );
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(20),
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
                    icon: const Icon(Icons.edit),
                    label: const Text('Name'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    )),
                'Freye'),
            textWidget(
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Surname'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    )),
                'Archeron'),
            textWidget(
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Location'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    )),
                'Free State'),
            textWidget(
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Phone Number'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    )),
                '0833850667'),
            textWidget(
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('ID Number'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    )),
                '9903310258001'),
            textWidget(
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Description'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    )),
                'I am 32 years old'),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Padding textWidget(TextButton txtBtn, String content) {
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
          txtBtn,
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
        color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
  );
}
