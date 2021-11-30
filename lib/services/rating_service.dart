import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/domain_constants.dart';
import 'package:help_for_hire_flutter_app/models/rating_model.dart';
import 'package:http/http.dart';

class RatingService with ChangeNotifier {
  /// If a duplicate rating is found then this will become true
  bool isDuplicate = false;

  /// Route in the web api to reach the rating controller
  static const _controllerRoute = '/api/rating';

  RatingService();

  /// Creates a new rating
  Future<void> postRating({
    required RatingModel rating,
  }) async {
    // Reset to false to make sure that previous calls do not break the code
    isDuplicate = false;

    final response = await post(
      Uri.parse(
        'https://${DomainConstants.ip}:5001$_controllerRoute',
      ),
      body: jsonEncode(rating),
      headers: {
        'Accept': 'application/json',
        'content-type': 'application/json',
      },
    );

    // Indicates that a duplicate rating was found
    if (response.statusCode == HttpStatus.badRequest) {
      isDuplicate = true;
    }

    notifyListeners();
  }
}
