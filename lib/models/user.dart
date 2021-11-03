import 'package:help_for_hire_flutter_app/models/skill.dart';
class User{

  String _userID;
  String _name;
  String _surname;
  String _phoneNumber;
  //image _profilePicture
  //location _location

  User(this._userID, this._name, this._surname, this._phoneNumber);

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get surname => _surname;

  set surname(String value) {
    _surname = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get userID => _userID;

  set userID(String value) {
    _userID = value;
  }
}

class Employer extends User{
  int employerID;

  Employer(this.employerID) : super(super._userID, super.name, super.surname, super.phoneNumber);

}

class Worker extends User{
  int _workerID;
  String _description;
  int _minFee;
  bool _fulltime;//1 if full time 0 if part time
  List<Skill> _skills;

  Worker(this._workerID, this._description, this._minFee, this._fulltime,
      this._skills) : super(super._userID, super.name, super.surname, super.phoneNumber);

  List<Skill> get skills => _skills;

  set skills(List<Skill> value) {
    _skills = value;
  }

  bool get fulltime => _fulltime;

  set fulltime(bool value) {
    _fulltime = value;
  }

  int get minFee => _minFee;

  set minFee(int value) {
    _minFee = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  int get workerID => _workerID;

  set workerID(int value) {
    _workerID = value;
  }
}