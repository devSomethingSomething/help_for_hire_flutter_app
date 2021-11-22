import 'package:flutter/material.dart';

class InvitesPage extends StatefulWidget {
  const InvitesPage({Key? key}) : super(key: key);

  @override
  _InvitesPageState createState() => _InvitesPageState();
}

class _InvitesPageState extends State<InvitesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Invites'),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [Text("Profile_page")],
                    ),
                  ),
                ),
              ),
              Center(
                child: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        _card('John Doe', 'Delete', 'Contact'),
                        _card('Jane Dawson', 'Delete', 'Contact'),
                        _card('Mike Row', 'Delete', 'Contact'),
                        _card('Tamlin', 'Delete', 'Contact'),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [Text("Other_page")],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColor(String status) {
    Color _bg;
    if (status == 'Delete') {
      _bg = Colors.red;
    } else {
      _bg = Colors.green;
    }

    return _bg;
  }

  Card _card(String txt, String status, String status2) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/default.jpg',
              height: 80,
              width: 80,
            ),
            Text(txt),
            ElevatedButton(
              child: Text(status),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  _getColor(status),
                ),
              ),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text(status2),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  _getColor(status2),
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Card _cardOther(String txt) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(txt),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ),
      ),
    );
  }

  Card _cardAccount(String txt) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(txt),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
