/// Imports
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/constants/domain_constants.dart';
import 'package:help_for_hire_flutter_app/models/invite_model.dart';
import 'package:http/http.dart';

/// Handles calls to the invite controller in the web API
class InviteService with ChangeNotifier {
  /// Invites retrieved from the database
  var invites = <InviteModel>[];

  /// List of JSON data retrieved from the database
  var _jsons = [];

  /// JSON data retrieved for a single entry
  var _json = <String, dynamic>{};

  /// Forms part of the address
  static const _controllerRoute = '/api/invite/';

  /// Constructor
  InviteService();

  /// Creates a new invite in the database
  Future<void> postInvite({
    required InviteModel invite,
  }) async {
    final response = await post(
      Uri.parse(
        'https://${DomainConstants.ip}:5001$_controllerRoute',
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
      } catch (_) {}
    } else {}
  }

  /// Gets a single invite from the database
  Future<void> getInvite({
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

        invites.add(
          InviteModel.fromJson(
            json: _json,
          ),
        );
      } catch (_) {}
    } else {}
  }

  /// Gets all the invites from the database
  Future<void> getInvites() async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}all',
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
      } catch (_) {}
    } else {}
  }

  /// Updates an invite
  Future<void> putInvite({
    required String id,
    required InviteModel invite,
  }) async {
    final response = await put(
      Uri.parse(
        'https://${DomainConstants.ip}:5001$_controllerRoute?id=$id',
      ),
      body: jsonEncode(invite),
      headers: {
        'Accept': 'application/json',
        'content-type': 'application/json',
      },
    );

    if (response.statusCode == HttpStatus.noContent) {
      try {} catch (_) {}
    } else {}

    notifyListeners();
  }

  /// Deletes an invite
  Future<void> deleteInvite({
    required String id,
  }) async {
    final response = await delete(
      Uri.parse(
        'https://${DomainConstants.ip}:5001$_controllerRoute?id=$id',
      ),
    );

    if (response.statusCode == HttpStatus.noContent) {
      invites.removeWhere(
        (invite) => invite.inviteId == id,
      );
    } else {}

    notifyListeners();
  }

  /// Gets all the invites for a specific employer
  Future<void> getInvitesForEmployer({
    required String employerId,
  }) async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}employer/?employerid=$employerId',
      ),
    );

    if (response.statusCode == HttpStatus.ok) {
      try {
        _jsons = jsonDecode(response.body);

        invites.clear();

        for (var json in _jsons) {
          invites.add(
            InviteModel.fromJson(
              json: json,
            ),
          );
        }
      } catch (_) {}
    } else {}

    notifyListeners();
  }

  /// Gets all the invites for a specific worker
  Future<void> getInvitesForWorker({
    required String id,
  }) async {
    final response = await get(
      Uri.parse(
        'https://${DomainConstants.ip}:5001${_controllerRoute}worker/?id=$id',
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
      } catch (_) {}
    } else {}
  }
}
