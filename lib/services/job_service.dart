import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/job_model.dart';
import 'package:http/http.dart';

class JobService with ChangeNotifier {
  var jobs = <JobModel>[];

  var _jsons = [];

  static const _controllerRoute = '/api/job/';

  JobService();

  Future<void> getJobs() async {
    final response = await get(
      Uri.parse(
        'https://192.168.101.166:5001${_controllerRoute}all',
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
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.notFound) {
      // Handle not found
    } else {
      // Handle other errors
    }

    notifyListeners();
  }
}
