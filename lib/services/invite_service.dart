import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/invite_model.dart';
import 'package:http/http.dart';

class InviteService with ChangeNotifier {
  var invites = <InviteModel>[];

  var _jsons = <Map<String, dynamic>>[];
  var _json = <String, dynamic>{};

  static const _controllerRoute = '/api/invite/';

  InviteService();

  Future<void> postInvite({
    required InviteModel invite,
  }) async {
    final response = await post(
      Uri.parse(
        'https://192.168.101.166:5001$_controllerRoute',
      ),
      body: jsonEncode(invite),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
    );

    if (response.statusCode == HttpStatus.created) {
      try {
        invites.add(invite);
      } catch (_) {
        // Handle fail
      }
    } else if (response.statusCode == HttpStatus.badRequest) {
      // Handle bad request
    } else {
      // Handle other errors
    }
  }

  Future<void> getInvite({
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

        invites.add(
          InviteModel.fromJson(
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

  Future<void> getInvites() async {
    final response = await get(
      Uri.parse(
        'https://192.168.101.166:5001${_controllerRoute}all',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        for (var json in _jsons) {
          invites.add(
            InviteModel.fromJson(
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

  Future<void> putInvite({
    required String id,
    required InviteModel invite,
  }) async {
    final response = await put(
      Uri.parse(
        'https://192.168.101.166:5001$_controllerRoute?id=$id',
      ),
      body: jsonEncode(invite),
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

  Future<void> deleteInvite({
    required String id,
  }) async {
    final response = await delete(
      Uri.parse(
        'https://192.168.101.166:5001$_controllerRoute?id=$id',
      ),
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

  Future<void> getInvitesForEmployer({
    required String id,
  }) async {
    final response = await get(
      Uri.parse(
        'https://192.168.101.166:5001${_controllerRoute}employer/?id=$id',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _json = jsonDecode(response.body);

        invites.add(
          InviteModel.fromJson(
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

  Future<void> getInvitesForWorker({
    required String id,
  }) async {
    final response = await get(
      Uri.parse(
        'https://192.168.101.166:5001${_controllerRoute}worker/?id=$id',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _json = jsonDecode(response.body);

        invites.add(
          InviteModel.fromJson(
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
}
