import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class EmployerData with ChangeNotifier {
  bool _error = false;

  String _errorMessage = '';

  Map<String, dynamic> _mapEmployer = {};

  Future<void> get fetchData async {
    final Response response = await get(
      Uri.parse(''),
    );
    if (response.statusCode == HttpStatus.ok) {
      try {
        _mapEmployer = jsonDecode(response.body);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _mapEmployer = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error';
      _mapEmployer = {};
    }
    notifyListeners();
  }

  void initialiseValues() {
    _mapEmployer = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }

  Map<String, dynamic> get mapEmployer => _mapEmployer;

  bool get error => _error;

  String get errorMessage => _errorMessage;
}
