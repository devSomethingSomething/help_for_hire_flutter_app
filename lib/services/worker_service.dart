import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';
import 'package:http/http.dart';

// This service should be able to
// - Post
// - Get
// - Get(All)
// - Put
// - Get(Query)
class WorkerService with ChangeNotifier {
  var workers = <WorkerModel>[];

  var _jsons = <Map<String, dynamic>>[];
  var _json = <String, dynamic>{};

  static const _controllerRoute = '/api/worker/';

  WorkerService();

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
      // Handle other errors
    }
  }

  Future<void> getWorker({
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

        // Need to handle null values cause from broken update methods in the web
        // api, should not merge but should add on instead
        workers.add(
          WorkerModel.fromJson(
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

    notifyListeners();
  }

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
}
