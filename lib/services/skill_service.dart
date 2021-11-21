import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class SkillService with ChangeNotifier {
  bool _error = false;

  String _errorMessage = '';

  Map<String, dynamic> _mapSkill = {};

  Future<void> get fetchData async {
    final Response response = await get(
      Uri.parse(''),
    );
    if (response.statusCode == HttpStatus.ok) {
      try {
        _mapSkill = jsonDecode(response.body);
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _mapSkill = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error';
      _mapSkill = {};
    }
    notifyListeners();
  }

  void initialiseValues() {
    _mapSkill = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }

  Map<String, dynamic> get mapSkill => _mapSkill;

  bool get error => _error;

  String get errorMessage => _errorMessage;
}
