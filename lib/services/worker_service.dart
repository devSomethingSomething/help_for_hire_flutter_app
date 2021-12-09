/// Imports
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/domain_constants.dart';
import 'package:help_for_hire_flutter_app/models/worker_model.dart';
import 'package:http/http.dart';

/// Handles calls to the worker controller in the web API
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

  /// Holds the average ratings for workers
  /// Will probably move this to the worker service class, then it has more
  /// control over this list and the query results
  var averageRatingsForWorkers = <int>[];

  /// Raw list of JSON data received from the web API after sending a request
  var _jsons = [];

  /// Holds JSON data from requests which return only a single result such as
  /// the getWorker method
  var _json = <String, dynamic>{};

  /// Route in the web API for the worker controller
  static const _controllerRoute = '/api/worker/';

  /// Constructor
  WorkerService();

  /// Sorts the list of workers
  ///
  /// Can be in ascending or descending order
  void sortByRatings({
    bool ascending = true,
  }) {
    workers.sort(
      (a, b) => a.averageRating.compareTo(b.averageRating),
    );

    if (!ascending) {
      workers = workers.reversed.toList();
    }

    notifyListeners();
  }

  /// Sorts the list of workers by name
  void sortByName({
    bool alphabetical = true,
  }) {
    workers.sort(
      (a, b) => a.name.compareTo(b.name),
    );

    if (!alphabetical) {
      workers = workers.reversed.toList();
    }

    notifyListeners();
  }

  /// Sorts the list of workers by surname
  void sortBySurname({
    bool alphabetical = true,
  }) {
    workers.sort(
      (a, b) => a.surname.compareTo(b.surname),
    );

    if (!alphabetical) {
      workers = workers.reversed.toList();
    }

    notifyListeners();
  }

  /// Creates a new worker in the database
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
      } catch (_) {}
    } else {}
  }

  /// Gets back a single worker from the database
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

        worker = WorkerModel.fromJson(
          json: _json,
        );
      } catch (_) {}
    } else {}

    notifyListeners();
  }

  /// Gets back all the workers from the database
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
      } catch (_) {}
    } else {}

    notifyListeners();
  }

  /// Gets all the workers in a specific city
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

        // Clear the ratings, allowing for a fresh calculation for new profiles
        averageRatingsForWorkers.clear();

        for (var i = 0; i < _jsons.length; i++) {
          workers.add(
            WorkerModel.fromJson(
              json: _jsons[i],
            ),
          );

          // Putting it here lets the UI load one card at a time
          await getAverageRatingForWorker(
            workerId: _jsons[i]['userId'],
          );

          workers[i].averageRating = averageRatingsForWorkers[i];
        }

        // for (var json in _jsons) {
        //   workers.add(
        //     WorkerModel.fromJson(
        //       json: json,
        //     ),
        //   );

        //   // Putting it here lets the UI load one card at a time
        //   await getAverageRatingForWorker(
        //     workerId: json['userId'],
        //   );
        // }
      } catch (_) {}
    } else {}

    notifyListeners();
  }

  /// Gets the average rating for a single worker
  Future<void> getAverageRatingForWorker({
    required String workerId,
  }) async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001/api/rating/worker/?workerid=$workerId',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        averageRatingsForWorkers.add(
          int.parse(
            response.body,
          ),
        );
      } catch (_) {}
    } else {}

    notifyListeners();
  }

  /// Gets all the workers with certain skills or jobs
  Future<void> getWorkersWithSkills({
    required String locationId,
    required List<String> jobIds,
  }) async {
    var jobIdParameters = StringBuffer();

    for (var jobId in jobIds) {
      jobIdParameters.write('&jobids=$jobId');
    }

    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}skills/?locationid=$locationId${jobIdParameters.toString()}',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        workers.clear();

        // Clear the ratings, allowing for a fresh calculation for new profiles
        averageRatingsForWorkers.clear();

        for (var i = 0; i < _jsons.length; i++) {
          workers.add(
            WorkerModel.fromJson(
              json: _jsons[i],
            ),
          );

          // Putting it here lets the UI load one card at a time
          await getAverageRatingForWorker(
            workerId: _jsons[i]['userId'],
          );

          workers[i].averageRating = averageRatingsForWorkers[i];
        }

        // for (var json in _jsons) {
        //   workers.add(
        //     WorkerModel.fromJson(
        //       json: json,
        //     ),
        //   );

        //   // Putting it here lets the UI load one card at a time
        //   await getAverageRatingForWorker(
        //     workerId: json['userId'],
        //   );
        // }
      } catch (_) {}
    } else {
      // ignore: avoid_print
      print(response.body);
    }

    notifyListeners();
  }

  /// Updates a single worker with new data
  Future<void> putWorker({
    required String id,
    required WorkerModel worker,
  }) async {
    final response = await put(
      Uri.parse(
        'https://${DomainConstants.ip}:5001$_controllerRoute?id=$id',
      ),
      body: jsonEncode(worker),
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
