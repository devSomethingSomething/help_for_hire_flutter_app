/// User Model will be the super class to the employer model and worker model
class UserModel {
  /// User Model variables
  String userId;
  String name;
  String surname;
  String phoneNumber;
  String locationId;

  /// User Model constructor with the required fields of the model variables
  UserModel({
    required this.userId,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.locationId,
  });

  /// This constructor initializes the User Model variables
  UserModel.empty({
    this.userId = '',
    this.name = '',
    this.surname = '',
    this.phoneNumber = '',
    this.locationId = '',
  });
}
