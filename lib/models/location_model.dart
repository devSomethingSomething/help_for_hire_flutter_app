class LocationModel {
  /// Location Model variables
  String locationId;
  String province;
  String city;

  /// Location Model constructor with the required fields of the model variables
  LocationModel({
    required this.locationId,
    required this.province,
    required this.city,
  });

  /// This constructor initializes the Location Model variables
  LocationModel.fromJson({
    required Map<String, dynamic> json,
  })  : locationId = json['locationId'],
        province = json['province'],
        city = json['city'];

  /// This method will convert the model data back into a map
  Map<String, dynamic> toJson() => {
        'locationId': locationId,
        'province': province,
        'city': city,
      };
}
