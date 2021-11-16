import 'package:help_for_hire_flutter_app/models/user_model.dart';

class Worker extends UserModel {
  int workerId;
  int minimumFee;

  String description;

  bool fullTime;
  bool partTime;

  // List<Skill> skills;

  Worker({
    required this.workerId,
    required this.minimumFee,
    required this.description,
    required this.fullTime,
    required this.partTime,
    required UserModel user,
  }) : super(
          userId: user.userId,
          name: user.name,
          surname: user.surname,
          phoneNumber: user.phoneNumber,
          locationId: user.locationId,
        );
}
