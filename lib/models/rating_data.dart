import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class RatingData with ChangeNotifier {
  bool _error = false;

  String _errorMessage = '';

  Map<String, dynamic> _mapRating = {};

  Future<void> get fetchData async {
    final Response response = await get(
      Uri.parse(''),
    );
    if (response.statusCode == HttpStatus.ok) {
      try {
        _mapRating = jsonDecode(response.body);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _mapRating = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error';
      _mapRating = {};
    }
    notifyListeners();
  }

  void initialiseValues() {
    _mapRating = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }

  Map<String, dynamic> get mapRating => _mapRating;

  bool get error => _error;

  String get errorMessage => _errorMessage;
}
