import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class UserService with ChangeNotifier {
  bool _error = false;

  String _errorMessage = '';

  Map<String, dynamic> _mapUser = {};

  Future<void> get fetchData async {
    final Response response = await get(
      Uri.parse(''),
    );
    if (response.statusCode == HttpStatus.ok) {
      try {
        _mapUser = jsonDecode(response.body);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _mapUser = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error';
      _mapUser = {};
    }
    notifyListeners();
  }

  void initialiseValues() {
    _mapUser = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }

  Map<String, dynamic> get mapUser => _mapUser;

  bool get error => _error;

  String get errorMessage => _errorMessage;
}
