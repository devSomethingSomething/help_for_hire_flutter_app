import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/location_model.dart';
import 'package:http/http.dart';

class LocationService with ChangeNotifier {
  var locations = <LocationModel>[];

  var _jsons = [];

  // LocationModel? location;
  // var _json = <String, dynamic>{};

  static const _controllerRoute = '/api/location/';

  LocationService();

  Future<void> getLocations() async {
    final response = await get(
      Uri.parse(
        'https://192.168.101.166:5001${_controllerRoute}all',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        locations.clear();

        for (var json in _jsons) {
          locations.add(
            LocationModel.fromJson(
              json: json,
            ),
          );
        }
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.notFound) {
      // Handle not found
      locations.clear();
    } else {
      // Handle other errors
    }

    notifyListeners();
  }

  Future<void> getCitiesInProvince({
    required String province,
  }) async {
    final response = await get(
      Uri.parse(
        'https://192.168.101.166:5001${_controllerRoute}cities/?province=$province',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        locations.clear();

        for (var json in _jsons) {
          locations.add(
            LocationModel.fromJson(
              json: json,
            ),
          );
        }
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.notFound) {
      // Handle not found
      locations.clear();
    } else {
      // Handle other errors
    }

    notifyListeners();
  }

  // Future<void> getLocation({required String id}) async {
  //   final response = await get(
  //     Uri.parse(
  //       'https://192.168.8.101:5001$_controllerRoute?id=$id',
  //     ),
  //   );

  //   if (response.statusCode == HttpStatus.ok) {
  //     try {
  //       _json = jsonDecode(response.body);

  //       for (var json in _jsons) {
  //         location = LocationModel.fromJson(
  //           json: json,
  //         );
  //       }
  //     } catch (_) {
  //       // Handle fail
  //     }
  //   } else if (response.statusCode == HttpStatus.notFound) {
  //     // Handle not found
  //   } else {
  //     // Handle other errors
  //   }
  // }
}
