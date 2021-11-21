import 'package:help_for_hire_flutter_app/models/user_model.dart';

class WorkerModel extends UserModel {
  int workerId;
  int minimumFee;

  String description;

  bool fullTime;
  bool partTime;

  // List<Skill> skills;

  WorkerModel({
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

  WorkerModel.fromJson({
    required Map<String, dynamic> json,
  })  : workerId = json['workerId'],
        minimumFee = json['minimumFee'],
        description = json['description'],
        fullTime = json['fullTime'],
        partTime = json['partTime'],
        super(
          userId: json['userId'],
          name: json['name'],
          surname: json['surname'],
          phoneNumber: json['phoneNumber'],
          locationId: json['locationId'],
        );

  Map<String, dynamic> toJson() => {
        'workerId': workerId,
        'minimumFee': minimumFee,
        'description': description,
        'fullTime': fullTime,
        'partTime': partTime,
      };
}
