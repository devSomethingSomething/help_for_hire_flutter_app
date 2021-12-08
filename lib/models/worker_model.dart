import 'package:help_for_hire_flutter_app/models/user_model.dart';

class WorkerModel extends UserModel {
  /// Worker Model variables
  String description;
  int minimumFee;
  bool fullTime;
  bool partTime;
  List<dynamic> jobIds;

  /// Stores the average rating for the worker
  int averageRating;

  /// Worker Model constructor with the required fields of the model variables
  WorkerModel({
    required this.description,
    required this.minimumFee,
    required this.fullTime,
    required this.partTime,
    required this.jobIds,
    required UserModel user,
    // Should be zero as this property does not exist within the firestore DB
    // Gets calculated later on
    this.averageRating = 0,
  }) : super(
          userId: user.userId,
          name: user.name,
          surname: user.surname,
          phoneNumber: user.phoneNumber,
          locationId: user.locationId,
        );

  /// This constructor initializes the worker Model variables and the the super class User Model
  WorkerModel.fromJson({
    required Map<String, dynamic> json,
  })  : description = json['description'],
        minimumFee = json['minimumFee'],
        fullTime = json['fullTime'],
        partTime = json['partTime'],
        jobIds = json['jobIds'],
        // Should be zero initially until the calculation happens
        averageRating = 0,
        super(
          userId: json['userId'],
          name: json['name'],
          surname: json['surname'],
          phoneNumber: json['phoneNumber'],
          locationId: json['locationId'],
        );

  /// This method will convert the model data back into a map
  Map<String, dynamic> toJson() => {
        'description': description,
        'minimumFee': minimumFee,
        'fullTime': fullTime,
        'partTime': partTime,
        'jobIds': jobIds,
        'userId': userId,
        'name': name,
        'surname': surname,
        'phoneNumber': phoneNumber,
        'locationId': locationId,
      };
}
