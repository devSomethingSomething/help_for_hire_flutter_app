class LocationModel {
  String locationId;
  String province;
  String city;

  LocationModel({
    required this.locationId,
    required this.province,
    required this.city,
  });

  LocationModel.fromJson({
    required Map<String, dynamic> json,
  })  : locationId = json['locationId'],
        province = json['province'],
        city = json['city'];

  Map<String, dynamic> toJson() => {
        'locationId': locationId,
        'province': province,
        'city': city,
      };
}
