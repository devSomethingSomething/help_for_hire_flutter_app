class ReportModel {
  String reportId;
  String reportType;
  String description;
  String userId;

  ReportModel({
    required this.reportId,
    required this.reportType,
    required this.description,
    required this.userId,
  });

  ReportModel.fromJson({
    required Map<String, dynamic> json,
  })  : reportId = json['reportId'],
        reportType = json['reportType'],
        description = json['description'],
        userId = json['userId'];

  Map<String, dynamic> toJson() => {
        'reportId': reportId,
        'reportType': reportType,
        'description': description,
        'userId': userId,
      };
}
