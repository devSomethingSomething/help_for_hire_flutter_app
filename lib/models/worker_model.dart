import 'package:help_for_hire_flutter_app/models/user_model.dart';

class WorkerModel extends UserModel {
  String description;

  int minimumFee;

  bool fullTime;
  bool partTime;

  // Need to store jobs or skills that a worker can do

  WorkerModel({
    required this.description,
    required this.minimumFee,
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
  })  : description = json['description'],
        minimumFee = json['minimumFee'],
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
        'description': description,
        'minimumFee': minimumFee,
        'fullTime': fullTime,
        'partTime': partTime,
        'userId': userId,
        'name': name,
        'surname': surname,
        'phoneNumber': phoneNumber,
        'locationId': locationId,
      };
}
