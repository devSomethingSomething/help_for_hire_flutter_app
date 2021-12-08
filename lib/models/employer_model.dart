/// Imports
import 'package:help_for_hire_flutter_app/models/user_model.dart';

/// Holds data related to employers
class EmployerModel extends UserModel {
  /// Employer Model variables
  String companyName;
  String address;
  String suburb;

  /// Employer Model constructor with the required fields of the model variables
  EmployerModel({
    required this.companyName,
    required this.address,
    required this.suburb,
    required UserModel user,
  }) : super(
          userId: user.userId,
          name: user.name,
          surname: user.surname,
          phoneNumber: user.phoneNumber,
          locationId: user.locationId,
        );

  /// This constructor initializes the Employer Model variables and the the super class User Model
  EmployerModel.fromJson({
    required Map<String, dynamic> json,
  })  : companyName = json['companyName'],
        address = json['address'],
        suburb = json['suburb'],
        super(
          userId: json['userId'],
          name: json['name'],
          surname: json['surname'],
          phoneNumber: json['phoneNumber'],
          locationId: json['locationId'],
        );

  /// This method will convert the model data back into a map
  Map<String, dynamic> toJson() => {
        'companyName': companyName,
        'address': address,
        'suburb': suburb,
        'userId': userId,
        'name': name,
        'surname': surname,
        'phoneNumber': phoneNumber,
        'locationId': locationId,
      };
}
