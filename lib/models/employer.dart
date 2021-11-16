import 'package:help_for_hire_flutter_app/models/user_model.dart';

class Employer extends UserModel {
  int employerId;

  Employer({
    required this.employerId,
    required UserModel user,
  }) : super(
          userId: user.userId,
          name: user.name,
          surname: user.surname,
          phoneNumber: user.phoneNumber,
          locationId: user.locationId,
        );
}
