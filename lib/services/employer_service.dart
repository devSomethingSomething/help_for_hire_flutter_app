/// Imports
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/domain_constants.dart';
import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:http/http.dart';

/// Handles calls to the employer controller in the web API
class EmployerService with ChangeNotifier {
  /// Employers retrieved from the database
  var employers = <EmployerModel>[];

  /// Single employer retrieved
  EmployerModel? employer;

  /// List of JSON data retrieved from the database
  var _jsons = <Map<String, dynamic>>[];

  /// JSON data retrieved for a single entry
  var _json = <String, dynamic>{};

  /// Forms part of the address
  static const _controllerRoute = '/api/employer/';

  /// Constructor
  EmployerService();

  /// Creates a new employer in the database
  Future<void> postEmployer({
    required EmployerModel employer,
  }) async {
    final response = await post(
      Uri.parse(
        'https://${DomainConstants.ip}:5001$_controllerRoute',
      ),
      body: jsonEncode(employer),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );

    if (response.statusCode == HttpStatus.created) {
      try {
        employers.add(employer);
      } catch (_) {}
    } else {}
  }

  /// Gets a single employer back from the database
  Future<void> getEmployer({
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

        employer = EmployerModel.fromJson(
          json: _json,
        );
      } catch (_) {}
    } else {}

    notifyListeners();
  }

  /// Gets all the employers from the database
  Future<void> getEmployers() async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}all',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        for (var json in _jsons) {
          employers.add(
            EmployerModel.fromJson(
              json: json,
            ),
          );
        }
      } catch (_) {}
    } else {}
  }

  /// Updates a single employer in the database
  Future<void> putEmployer({
    required String id,
    required EmployerModel employer,
  }) async {
    final response = await put(
      Uri.parse(
        'https://${DomainConstants.ip}:5001$_controllerRoute?id=$id',
      ),
      body: jsonEncode(employer),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );

    if (response.statusCode == HttpStatus.noContent) {
      try {} catch (_) {}
    } else {}
  }
}
