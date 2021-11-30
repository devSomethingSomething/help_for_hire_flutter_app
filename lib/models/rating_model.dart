class RatingModel {
  String ratingId;
  String description;
  String employerId;
  String workerId;

  int value;

  RatingModel({
    required this.ratingId,
    required this.value,
    required this.description,
    required this.employerId,
    required this.workerId,
  });

  RatingModel.fromJson({
    required Map<String, dynamic> json,
  })  : ratingId = json['ratingId'],
        value = json['value'],
        description = json['description'],
        employerId = json['employerId'],
        workerId = json['workerId'];

  Map<String, dynamic> toJson() => {
        'ratingId': ratingId,
        'value': value,
        'description': description,
        'employerId': employerId,
        'workerId': workerId,
      };
}
