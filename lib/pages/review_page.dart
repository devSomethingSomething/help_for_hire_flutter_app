import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/widget_controller/review_rating.dart';


class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int _rating = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => (null),
          ),
          title: Text(
            'Review',
          ),
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Column(
              children: [
                Text('Review'),
                SizedBox(
                  height: 30,
                ),
                Text('Page Details'),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Choose Rating',
                        style: TextStyle(fontSize: 18),
                      ),
                      Rating((rating) {
                        setState(() {
                          _rating = rating;
                        });
                      }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [_container("User Id")],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [_container("Extra Information")],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue.shade100,
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
                            'Submit Review',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      
      borderRadius: BorderRadius.zero,
      border: Border.all(
        width: 1.0,
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
}
