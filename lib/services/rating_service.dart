import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:help_for_hire_flutter_app/models/rating.dart';

class RatingService with ChangeNotifier {

 static var ratings=<Rating>[];


  bool _error = false;

  String _errorMessage = '';
  static const _controllerRoute = '/api/rating/';

  Map<String, dynamic> _mapRating = {};

  Future<void> get fetchData async {
    final Response response = await get(
      Uri.parse('https://192.168.8.101:5001${_controllerRoute}all'),
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
