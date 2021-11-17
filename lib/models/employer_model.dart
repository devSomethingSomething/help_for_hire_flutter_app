import 'package:help_for_hire_flutter_app/models/user_model.dart';

class EmployerModel extends UserModel {
  EmployerModel({
    required UserModel user,
  }) : super(
          userId: user.userId,
          name: user.name,
          surname: user.surname,
          phoneNumber: user.phoneNumber,
          locationId: user.locationId,
        );

  EmployerModel.fromJson({
    required Map<String, dynamic> json,
  }) : super(
          userId: json['userId'],
          name: json['name'],
          surname: json['surname'],
          phoneNumber: json['phoneNumber'],
          locationId: json['locationId'],
        );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'name': name,
        'surname': surname,
        'phoneNumber': phoneNumber,
        'locationId': locationId,
      };
}
