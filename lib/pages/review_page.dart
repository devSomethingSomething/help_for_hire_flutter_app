// ignore_for_file: unused_field, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/widget_controller/review_rating.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/heading_text_widget.dart';

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
          title: Text('Review'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () => Navigator.pop(context),
            padding: EdgeInsets.zero,
          ),
          backgroundColor: ColorConstants.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HeadingTextWidget(
                  data: 'Review',
                ),
                //want to retrieve reviewed account details
                Text('reviewed account details'),
                Rating((rating) {
                  setState(() {
                    _rating = rating;
                  });
                }),             
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Other reasons',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lightBlueAccent, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lightBlueAccent, width: 2.0),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        maxLines: 5,
                      ),
                    ],
                  ),
                ),
                ButtonWidget(data: 'Submit Report', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
