import 'package:help_for_hire_flutter_app/models/user_model.dart';

class EmployerModel extends UserModel {
//String companyName;
//String address;
//String suburb;

  EmployerModel({
    //required this.companyName,
    //required this.address,
    //required this.suburb,
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
  }) : //companyName = json['companyName'],
        //address = json['address'],
        //suburb = json['suburb'],
        super(
          userId: json['userId'],
          name: json['name'],
          surname: json['surname'],
          phoneNumber: json['phoneNumber'],
          locationId: json['locationId'],
        );

  Map<String, dynamic> toJson() => {
        //'companyName' = companyName,
        //'address' = address,
        //'suburb' = suburb,
        'userId': userId,
        'name': name,
        'surname': surname,
        'phoneNumber': phoneNumber,
        'locationId': locationId,
      };
}
