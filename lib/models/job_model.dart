/// Holds job related data
class JobModel {
  /// Job Model variables
  String jobId;
  String title;

  /// Job Model constructor with the required fields of the model variables
  JobModel({
    required this.jobId,
    required this.title,
  });

  /// This constructor initializes the Job Model variables
  JobModel.fromJson({
    required Map<String, dynamic> json,
  })  : jobId = json['jobId'],
        title = json['title'];

  /// This method will convert the model data back into a map
  Map<String, dynamic> toJson() => {
        'jobId': jobId,
        'title': title,
      };
}
