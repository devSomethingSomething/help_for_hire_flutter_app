class UserModel {
  String userId;
  String name;
  String surname;
  String phoneNumber;
  String locationId;

  UserModel({
    required this.userId,
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.locationId,
  });

  UserModel.empty({
    this.userId = '',
    this.name = '',
    this.surname = '',
    this.phoneNumber = '',
    this.locationId = '',
  });
}
