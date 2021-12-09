/// Imports
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/domain_constants.dart';
import 'package:help_for_hire_flutter_app/models/job_model.dart';
import 'package:http/http.dart';

/// Handles calls to the job controller in the web API
class JobService with ChangeNotifier {
  /// Jobs retrieved from the database
  var jobs = <JobModel>[];

  /// Selected jobs retrieved from the database
  var selectedJobs = <JobModel>[];

  /// List of JSON data retrieved from the database
  var _jsons = [];

  /// Forms part of the address
  static const _controllerRoute = '/api/job/';

  /// Constructor
  JobService();

  /// Gets all the jobs from the database
  Future<void> getJobs() async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}all',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        jobs.clear();

        for (var json in _jsons) {
          jobs.add(
            JobModel.fromJson(
              json: json,
            ),
          );
        }
      } catch (_) {}
    } else {}

    notifyListeners();
  }

  /// Gets selected jobs from the database
  Future<void> getSelectedJobs({
    required List<dynamic> ids,
  }) async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}selected/?ids=$ids',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        jobs.clear();

        for (var json in _jsons) {
          jobs.add(
            JobModel.fromJson(
              json: json,
            ),
          );
        }
      } catch (_) {}
    } else {}

    notifyListeners();
  }
}
