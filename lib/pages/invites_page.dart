import 'package:flutter/material.dart';

class InvitesPage extends StatelessWidget {
  const InvitesPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              size: 28.0,
            ),
            // Needs to get the invites again when clicked
            onPressed: () {},
            splashRadius: 28.0,
          ),
        ],
        backgroundColor: Colors.blue[900],
        title: const Text(
          'Invites',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          8.0,
        ),
        child: Center(
          child: ListView(
            children: [
              Card(
                elevation: 4.0,
                child: ListTile(
                  tileColor: Colors.grey[100],
                  leading: const SizedBox(
                    child: Placeholder(
                      color: Colors.black,
                    ),
                    height: 48.0,
                    width: 48.0,
                  ),
                  title: const Text(
                    'John Doe',
                  ),
                  subtitle: const Text(
                    'Pending',
                  ),
                  trailing: Row(
                    children: [
                      ElevatedButton(
                        child: const Text(
                          'Contact',
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 2.0,
                          primary: Colors.green,
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      ElevatedButton(
                        child: const Text(
                          'Delete',
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 2.0,
                          primary: Colors.red,
                        ),
                      ),
                    ],
                    mainAxisSize: MainAxisSize.min,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // Needs to be the same between pages
      drawer: const Drawer(),
      drawerEnableOpenDragGesture: false,
    );
  }
}
