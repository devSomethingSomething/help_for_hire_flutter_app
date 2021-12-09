/// Imports
import 'dart:convert';
import 'dart:io';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/domain_constants.dart';
import 'package:help_for_hire_flutter_app/models/location_model.dart';
import 'package:http/http.dart';

/// Handles calls to the location controller in the web API
class LocationService with ChangeNotifier {
  /// Locations retrieved from the database
  var locations = <LocationModel>[];

  /// Single location retrieved
  LocationModel? location;

  bool locationRefreshed = false;

  /// List of JSON data retrieved from the database
  var _jsons = [];

  /// JSON data retrieved for a single entry
  var _json = <String, dynamic>{};

  /// Forms part of the address
  static const _controllerRoute = '/api/location/';

  /// Constructor
  LocationService();

  /// Gets a single location
  Future<void> getLocation({
    required String id,
  }) async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001$_controllerRoute?id=$id',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _json = jsonDecode(response.body);

        location = LocationModel.fromJson(
          json: _json,
        );
      } catch (_) {}
    } else {}
    locationRefreshed = true;
    notifyListeners();
    Future.delayed(Duration(seconds: 3),(){
      locationRefreshed = false;
    });
  }

  /// Gets all the locations from the database
  Future<void> getLocations() async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}all',
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
      } catch (_) {}
    } else if (response.statusCode == HttpStatus.notFound) {
      locations.clear();
    } else {}

    notifyListeners();
  }

  /// Gets all the locations in a certain province
  Future<void> getCitiesInProvince({
    required String province,
  }) async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}cities/?province=$province',
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
      } catch (_) {}
    } else if (response.statusCode == HttpStatus.notFound) {
      locations.clear();
    } else {}

    notifyListeners();
  }
}
