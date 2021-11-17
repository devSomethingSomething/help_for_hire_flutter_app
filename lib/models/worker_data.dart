import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class WorkerData with ChangeNotifier {
  bool _error = false;

  String _errorMessage = '';

  Map<String, dynamic> _mapWorker = {};

  Future<void> get fetchData async {
    final Response response = await get(
      Uri.parse(''),
    );
    if (response.statusCode == HttpStatus.ok) {
      try {
        _mapWorker = jsonDecode(response.body);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _mapWorker = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error';
      _mapWorker = {};
    }
    notifyListeners();
  }

  void initialiseValues() {
    _mapWorker = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }

  Map<String, dynamic> get mapWorker => _mapWorker;

  bool get error => _error;

  String get errorMessage => _errorMessage;
}
