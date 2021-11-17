// ignore_for_file: prefer_final_fields, prefer_const_constructors, avoid_returning_null_for_void, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: ('Account')),
                Tab(text: ('Invites')),
                Tab(text: ('Other')),
              ],
            ),
            title: const Text('History'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => null,
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        _cardAccount(
                            'You reviewed Jane Dawsons Profile on \n\t ${DateTime.now()}'),
                        _cardAccount(
                            'You reviewed Janes Profile on \n\t${DateTime.now()}')
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
                      children: [
                        _card('John Doe', 'Declined'),
                        _card('Jane Dawson', 'Accepted'),
                        _card('Mike Row', 'Declined'),
                        _card('Tamlin', 'Accepted'),
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
                      children: [_cardOther('John Doe')],
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
    if (status == 'Declined') {
      _bg = Colors.red;
    } else {
      _bg = Colors.green;
    }

    return _bg;
  }

  Card _card(String txt, String status) {
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
              children: [
                Text('Reviews'),
                SizedBox(
                  height: 10,
                ),
                Text('Get Number of Reviews'),
                SizedBox(
                  height: 10,
                ),
                Text('Get Number of Contacts'),
                SizedBox(
                  height: 10,
                ),
              ],
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
