import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class HistoryService with ChangeNotifier {
  bool _error = false;

  String _errorMessage = '';

  Map<String, dynamic> _mapHistory = {};

  Future<void> get fetchData async {
    final Response response = await get(
      Uri.parse(''),
    );
    if (response.statusCode == HttpStatus.ok) {
      try {
        _mapHistory = jsonDecode(response.body);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _mapHistory = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error';
      _mapHistory = {};
    }
    notifyListeners();
  }

  void initialiseValues() {
    _mapHistory = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }

  Map<String, dynamic> get mapHistory => _mapHistory;

  bool get error => _error;

  String get errorMessage => _errorMessage;
}
