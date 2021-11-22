import 'package:help_for_hire_flutter_app/models/employer_model.dart';
import 'package:help_for_hire_flutter_app/models/worker.dart';

class RatingModel {
  int ratingId;
  int value;
  String description;
  //Worker worker;
  //EmployerModel employer;

  RatingModel({
    required this.ratingId,
    required this.value,
    required this.description,
    // required this.worker,
    // required this.employer,
  });

  RatingModel.fromJson({
    required Map<String, dynamic> json,
  })  : ratingId = json['ratingId'],
        value = json['value'],
        description = json['description']
        // worker = json['worker'],
        // employer = json['employer']
  ;

  Map<String, dynamic> toJson() => {
        'ratingId': ratingId,
        'value': value,
        'description': description,
        //'worker': worker,
        //'employer': employer,
      };
}
