import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class InviteData with ChangeNotifier {
  bool _error = false;

  String _errorMessage = '';

  Map<String, dynamic> _mapInvite = {};

  Future<void> get fetchData async {
    final Response response = await get(
      Uri.parse(''),
    );
    if (response.statusCode == HttpStatus.ok) {
      try {
        _mapInvite = jsonDecode(response.body);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _mapInvite = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error';
      _mapInvite = {};
    }
    notifyListeners();
  }

  void initialiseValues() {
    _mapInvite = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }

  Map<String, dynamic> get mapInvite => _mapInvite;

  bool get error => _error;

  String get errorMessage => _errorMessage;
}

