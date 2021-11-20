import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/models/user_model.dart';

class UserService with ChangeNotifier {
  UserModel currentUser = UserModel(
    userId: '',
    name: '',
    surname: '',
    phoneNumber: '',
    locationId: '',
  );

  UserService();
}
