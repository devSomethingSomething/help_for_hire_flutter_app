class JobModel {
  String jobId;
  String title;

  JobModel({
    required this.jobId,
    required this.title,
  });

  JobModel.fromJson({
    required Map<String, dynamic> json,
  })  : jobId = json['jobId'],
        title = json['title'];

  Map<String, dynamic> toJson() => {
        'jobId': jobId,
        'title': title,
      };
}
