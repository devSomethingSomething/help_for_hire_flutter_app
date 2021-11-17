import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class JobData with ChangeNotifier {
  bool _error = false;

  String _errorMessage = '';

  Map<String, dynamic> _mapJob = {};

  Future<void> get fetchData async {
    final Response response = await get(
      Uri.parse(''),
    );
    if (response.statusCode == HttpStatus.ok) {
      try {
        _mapJob = jsonDecode(response.body);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _mapJob = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error';
      _mapJob = {};
    }
    notifyListeners();
  }

  void initialiseValues() {
    _mapJob = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }

  Map<String, dynamic> get mapJob => _mapJob;

  bool get error => _error;

  String get errorMessage => _errorMessage;
}
