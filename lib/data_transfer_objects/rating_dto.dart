class RatingDto {

  int value;

  String description;
  String employerId;
  String workerId;

  RatingDto({
    required this.value,
    required this.description,
    required this.employerId,
    required this.workerId,
  });

  RatingDto.fromJson({
    required Map<String, dynamic> json,
  })  : value = json['value'],
        description = json['description'],
        employerId = json['employerId'],
        workerId = json['workerId'];

  Map<String, dynamic> toJson() => {
    'value': value,
    'description': description,
    'employerId': employerId,
    'workerId': workerId,
  };
}
