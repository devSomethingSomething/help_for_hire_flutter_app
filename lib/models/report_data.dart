import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class ReportData with ChangeNotifier {
  bool _error = false;

  String _errorMessage = '';

  Map<String, dynamic> _mapReport = {};

  Future<void> get fetchData async {
    final Response response = await get(
      Uri.parse(''),
    );
    if (response.statusCode == HttpStatus.ok) {
      try {
        _mapReport = jsonDecode(response.body);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _mapReport = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error';
      _mapReport = {};
    }
    notifyListeners();
  }

  void initialiseValues() {
    _mapReport = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }

  Map<String, dynamic> get mapReport => _mapReport;

  bool get error => _error;

  String get errorMessage => _errorMessage;
}
