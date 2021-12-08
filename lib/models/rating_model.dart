/// Rating related data
class RatingModel {
  /// Rating Model variables
  String ratingId;
  String description;
  String employerId;
  String workerId;
  int value;

  /// Rating Model constructor with the required fields of the model variables
  RatingModel({
    required this.ratingId,
    required this.value,
    required this.description,
    required this.employerId,
    required this.workerId,
  });

  /// This constructor initializes the Rating Model variables
  RatingModel.fromJson({
    required Map<String, dynamic> json,
  })  : ratingId = json['ratingId'],
        value = json['value'],
        description = json['description'],
        employerId = json['employerId'],
        workerId = json['workerId'];

  /// This method will convert the model data back into a map
  Map<String, dynamic> toJson() => {
        'ratingId': ratingId,
        'value': value,
        'description': description,
        'employerId': employerId,
        'workerId': workerId,
      };
}
