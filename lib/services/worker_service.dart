import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/domain_constants.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';
import 'package:http/http.dart';

class WorkerService with ChangeNotifier {
  /// Holds a reference to a worker
  ///
  /// Used in the registration process and also in pages like the profile
  /// discovery page
  WorkerModel? worker;

  /// Holds a list of workers
  ///
  /// Used for pages like the profile discovery page where it holds all
  /// the query results for workers
  var workers = <WorkerModel>[];

  /// Raw list of JSON data received from the web API after sending a request
  var _jsons = [];

  /// Holds JSON data from requests which return only a single result such as
  /// the getWorker method
  var _json = <String, dynamic>{};

  /// Route in the web API for the worker controller
  static const _controllerRoute = '/api/worker/';

  WorkerService();

  Future<void> postWorker({
    required WorkerModel worker,
  }) async {
    final response = await post(
      Uri.parse(
        'https://${DomainConstants.ip}:5001$_controllerRoute',
      ),
      body: jsonEncode(worker),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );

    if (response.statusCode == HttpStatus.created) {
      try {
        workers.add(worker);
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.badRequest) {
      // Handle bad request
    } else {
      // Handle other errors
    }
  }

  Future<void> getWorker({
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

        worker = WorkerModel.fromJson(json: _json);
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

  Future<void> getWorkers() async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}all',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        workers.clear();

        for (var json in _jsons) {
          workers.add(
            WorkerModel.fromJson(
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

  Future<void> getWorkersInCity({
    required String locationId,
  }) async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}cities/?locationid=$locationId',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        workers.clear();

        for (var json in _jsons) {
          workers.add(
            WorkerModel.fromJson(
              json: json,
            ),
          );
        }
      } catch (_) {}
    } else {}

    notifyListeners();
  }
}
