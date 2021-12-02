import 'package:flutter/material.dart';

class CheckBoxHelper extends ChangeNotifier{
  bool _partTime=false;
  bool _fullTime=false;

  bool get partTime => _partTime;

  set partTime(bool value) {
    _partTime = value;
    notifyListeners();
  }

  bool get fullTime => _fullTime;

  set fullTime(bool value) {
    _fullTime = value;
    notifyListeners();
  }
}