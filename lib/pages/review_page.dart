// ignore_for_file: unused_field, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/color_constants.dart';
import 'package:help_for_hire_flutter_app/models/rating_model.dart';
import 'package:help_for_hire_flutter_app/services/rating_service.dart';
import 'package:help_for_hire_flutter_app/widget_controller/review_rating.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/buttons/rounded_button_widget.dart';
import 'package:help_for_hire_flutter_app/widgets/text/heading_text_widget.dart';
import 'package:help_for_hire_flutter_app/services/employer_service.dart';
import 'package:help_for_hire_flutter_app/services/worker_service.dart';
import 'package:help_for_hire_flutter_app/data_transfer_objects/rating_dto.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  TextEditingController descriptionController = TextEditingController();
  RatingService _ratingService = RatingService();
  int _rating = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Consumer2<EmployerService, WorkerService>(
            builder: (context, employerService, workerService, child) {
          return Scaffold(
            backgroundColor: Colors.grey.shade100,
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
                      data: 'Review Details',
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
                              hintText: 'Please leave a comment for the review',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlueAccent, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.lightBlueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                            maxLines: 5,
                            controller: descriptionController,
                          ),
                        ],
                      ),
                    ),
                    RoundedButtonWidget(
                      data: 'Submit Review',
                      onPressed: () {
                        _ratingService.postRating(
                            rating: RatingDto(
                                value: _rating,
                                description: descriptionController.text,
                                employerId: employerService.employer!.userId,
                                workerId: workerService.worker!.userId));
                      },
                      invertColors: true,
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
