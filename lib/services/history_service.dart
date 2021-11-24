import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/history_model.dart';
import 'package:http/http.dart';

class HistoryService with ChangeNotifier {
  var histories = <HistoryModel>[];

  var _jsons = [];
  var _json = <String, dynamic>{};

  static const _controllerRoute = '/api/history/';

  HistoryService();

  Future<void> postHistory({
    required HistoryModel history,
  }) async {
    final response = await post(
      Uri.parse(
        'https://192.168.101.166:5001$_controllerRoute',
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
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.badRequest) {
      // Handle bad request
    } else {
      // Handle other errors
    }

    notifyListeners();
  }

  Future<void> getHistory({
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

        histories.add(
          HistoryModel.fromJson(
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
  }

  Future<void> getHistories() async {
    final response = await get(
      Uri.parse(
        'https://192.168.101.166:5001${_controllerRoute}all',
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
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.notFound) {
      // Handle not found
    } else {
      // Handle other errors
    }
  }

  Future<void> getHistoryByUser({
    required String id,
  }) async {
    final response = await get(
      Uri.parse(
        'https://192.168.101.166:5001${_controllerRoute}user/?userid=$id',
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
      } catch (e) {
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
