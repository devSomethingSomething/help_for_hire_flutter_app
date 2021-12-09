/// Imports
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/domain_constants.dart';
import 'package:help_for_hire_flutter_app/models/history_model.dart';
import 'package:http/http.dart';

/// Handles calls to the history controller in the web API
class HistoryService with ChangeNotifier {
  /// History entries retrieved from the database
  var histories = <HistoryModel>[];

  /// List of JSON data retrieved from the database
  var _jsons = [];

  /// JSON data retrieved for a single entry
  var _json = <String, dynamic>{};

  /// Forms part of the address
  static const _controllerRoute = '/api/history/';

  /// Constructor
  HistoryService();

  /// Creates a new history entry in the database
  Future<void> postHistory({
    required HistoryModel history,
  }) async {
    final response = await post(
      Uri.parse(
        'https://${DomainConstants.ip}:5001$_controllerRoute',
      ),
      body: jsonEncode(history),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );

    if (response.statusCode == HttpStatus.created) {
      try {
        histories.add(history);
      } catch (_) {}
    } else {}

    notifyListeners();
  }

  /// Gets a single history entry
  Future<void> getHistory({
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

        histories.add(
          HistoryModel.fromJson(
            json: _json,
          ),
        );
      } catch (_) {}
    } else {}
  }

  /// Gets all the history from the database
  Future<void> getHistories() async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}all',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        for (var json in _jsons) {
          histories.add(
            HistoryModel.fromJson(
              json: json,
            ),
          );
        }
      } catch (_) {}
    } else {}
  }

  /// Deletes all the history for a user
  Future<void> deleteAllHistoryForUser({
    required String userId,
  }) async {
    final response = await delete(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}all/?userid=$userId',
      ),
    );

    if (response.statusCode == HttpStatus.noContent) {
      histories.clear();
    } else {}

    notifyListeners();
  }

  /// Gets all the history for a specific user
  Future<void> getHistoryByUser({
    required String id,
  }) async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}user/?userid=$id',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        histories.clear();

        for (var json in _jsons) {
          histories.add(
            HistoryModel.fromJson(
              json: json,
            ),
          );
        }
      } catch (_) {}
    } else {}

    notifyListeners();
  }
}
