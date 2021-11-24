import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:help_for_hire_flutter_app/models/rating_model.dart';
import 'package:http/http.dart';

class RatingService with ChangeNotifier {
  var rating = <RatingModel>[];

  var _jsons = <Map<String, dynamic>>[];
  var _json = <String, dynamic>{};

  static const _controllerRoute = '/api/rating';

  RatingService();

  Future<void> postRating({
    required RatingModel rating,
  }) async {
    final response = await post(
      Uri.parse('https://192.168.101.166:5001$_controllerRoute'),
      body: jsonEncode(rating),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );
    if (response.statusCode == HttpStatus.created) {
      try {
        // Request worked code
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.badRequest) {
      // Handle bad request
    } else {
      // Handle other errors
    }
  }

  Future<void> getRating({
    required String id,
  }) async {
    final response = await get(
      Uri.parse(
        'https://192.168.101.166:5001$_controllerRoute?id=$id',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _json = jsonDecode(response.body);

        rating.add(
          RatingModel.fromJson(
            json: _json,
          ),
        );
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.notFound) {
      // Handle not found
    } else {
      // Handle other errors
    }
  }

  Future<void> getRatings() async {
    final response = await get(
      Uri.parse(
        'https://192.168.101.166:5001${_controllerRoute}all',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        for (var json in _jsons) {
          rating.add(
            RatingModel.fromJson(
              json: json,
            ),
          );
        }
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.notFound) {
      // Handle not found
    } else {
      // Handle other errors
    }
  }

  Future<void> putRating({
    required String id,
    required RatingModel rating,
  }) async {
    final response = await put(
      Uri.parse(
        'https://192.168.101.166:5001$_controllerRoute?id=$id',
      ),
      body: jsonEncode(rating),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );

    if (response.statusCode == HttpStatus.noContent) {
      try {
        // Request worked code
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.notFound) {
      // Handle bad request
    } else {
      // Handle other errors
    }
  }

//Need to look into delete a bit more

  // Future<void> deleteRating({
  //   required String id,
  // }) async {
  //   final response = await put(
  //     Uri.parse(
  //       '',
  //     ),
  //     body: jsonEncode(rating),
  //     headers: {
  //       "Accept": "application/json",
  //       "content-type": "application/json",
  //     },
  //   );

  //   if (response.statusCode == HttpStatus.noContent) {
  //     try {
  //       // Request worked code
  //     } catch (_) {
  //       // Handle fail
  //     }
  //   } else if (response.statusCode == HttpStatus.notFound) {
  //     // Handle bad request
  //   } else {
  //     // Handle other errors
  //   }
  // }
}
