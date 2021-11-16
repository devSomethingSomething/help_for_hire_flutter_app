import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/location_model.dart';
import 'package:http/http.dart';

class LocationService with ChangeNotifier {
  var locations = <LocationModel>[];

  var locationsJson = [];

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
        locationsJson = jsonDecode(response.body);
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.notFound) {
      // Handle not found
    } else {
      // Handle other errors
    }
  }
}
