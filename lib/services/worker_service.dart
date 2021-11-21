import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:help_for_hire_flutter_app/models/worker.dart';
import 'package:http/http.dart';

class WorkerService with ChangeNotifier {
  var workers = <WorkerModel>[];
  var _jsons = <Map<String, dynamic>>[];
  var _json = <String, dynamic>{};

  static const _controllerRoute = '/api/worker/';

  WorkerService();

  // Post
  Future<void> postWorker({
    required WorkerModel worker,
  }) async {
    final response = await post(
      Uri.parse(''), // Need to add the link
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
      // handle other errors
    }
  }

  // Get id
  Future<void> getWorker({
    required String id,
  }) async {
    final response = await post(
      Uri.parse(''), // Need to add the link
    );
    if (response.statusCode == HttpStatus.ok) {
      try {
        _json = jsonDecode(response.body);

        workers.add(WorkerModel.fromJson(
          json: _json,
        ));
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.notFound) {
      // Handle not found
    } else {
      // Handle other errors
    }
  }

  // Get all
  Future<void> getWorkers() async {
    final response = await get(
      Uri.parse(''), // Need to add the link
    );
    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

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
  }

  // Put
  Future<void> putWorker({
    required String id,
    required WorkerModel worker,
  }) async {
    final response = await put(
      Uri.parse(''), // Need to add the link
      body: jsonEncode(worker),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );
    if (response.statusCode == HttpStatus.noContent) {
      try {
        // Reqeust worker code
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.notFound) {
      // Handle bad request
    } else {
      // Handle other errors
    }
  }
}
