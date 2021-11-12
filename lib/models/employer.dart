import 'package:help_for_hire_flutter_app/models/user.dart';

class Employer extends User {
  int employerId;

  Employer({
    required this.employerId,
    required User user,
  }) : super(
          userId: user.userId,
          name: user.name,
          surname: user.surname,
          phoneNumber: user.phoneNumber,
        );
}
